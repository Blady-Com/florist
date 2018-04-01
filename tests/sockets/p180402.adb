------------------------------------------------------------------------------
--                                                                          --
--                      POSIX.5c VALIDATION TEST SUITE                      --
--                                                                          --
--                             P 1 8 0 4 0 2                                --
--                                                                          --
--                                B o d y                                   --
--                                                                          --
--                                                                          --
--  Copyright (c) 1995-1999 Florida  State  University  (FSU).  All Rights  --
--  Reserved.                                                               --
--                                                                          --
--  This is free software;  you can redistribute it and/or modify it under  --
--  terms of the  GNU  General  Public  License  as published by the  Free  --
--  Software Foundation;  either version 2, or (at your option) any  later  --
--  version.  This  software  is distributed  in the hope that it  will be  --
--  useful, but WITHOUT ANY WARRANTY; without even the implied warranty of  --
--  MERCHANTABILITY   or  FITNESS FOR A PARTICULAR PURPOSE.   See the  GNU  --
--  General Public License for more details.  You  should have  received a  --
--  copy of the GNU General Public License  distributed  with  GNARL;  see  --
--  file  COPYING.  If not,  write to  the  Free  Software  Foundation, 59  --
--  Temple Place - Suite 330, Boston, MA 02111-1307, USA.                   --
--                                                                          --
--  Under contract  GS-35F-4506G, the U. S. Government obtained  unlimited  --
--  rights in the software and documentation contained herein.   Unlimited  --
--  rights are defined in DFAR 252,227-7013(a)(19).  By making this public  --
--  release,   the  Government  intends  to  confer  upon  all  recipients  --
--  unlimited  rights equal to those held by the Government.  These rights  --
--  include rights to use,  duplicate,  release  or  disclose the released  --
--  data an computer software  in whole or in part,  in any manner and for  --
--  any purpose whatsoever, and to have or permit others to do so.          --
--                                                                          --
--  DISCLAIMER   --   ALL MATERIALS OR INFORMATION HEREIN RELEASED,   MADE  --
--  AVAILABLE OR DISCLOSED ARE AS IS.   THE GOVERNMENT MAKES NO EXPRESS OR  --
--  IMPLIED WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS  --
--  OF THE SOFTWARE,  DOCUMENTATION  OR  OTHER INFORMATION RELEASED,  MADE  --
--  AVAILABLE OR DISCLOSED,  OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS  --
--  FOR A PARTICULAR PURPOSE OF SAID MATERIAL.                              --
--                                                                          --
------------------------------------------------------------------------------

--  Multiprocess integrated test for package POSIX_Sockets
--  in IEEE Std 1003.5c Section 18.4 with package
--  POSIX_Sockets_Interent.

--  This test covers only features that depend only on
--  the packages (POSIX_Sockets/_Interent) and features from
--  other packages that are required to be supported.

with POSIX,
     POSIX_Sockets,
     POSIX_Sockets_Internet,
     POSIX_Report,
     POSIX_IO,
     POSIX_Process_Primitives,
     Unchecked_Conversion,
--     Test_Parameters,
     System,
     POSIX_Process_Environment,
     POSIX_Process_Identification;

--  with Ada.Integer_Text_IO;
--  with Ada.Text_IO;


procedure p180402 is

   use POSIX,
       POSIX_Sockets,
       POSIX_Sockets_Internet,
       POSIX_IO,
       POSIX_Process_Primitives,
       POSIX_Process_Identification,
       POSIX_Process_Environment,
--       Test_Parameters,
       POSIX_Report;

   --  These are declared in Posix.C but not intended to be used from there
   PF_MAX    : constant := 25;
   PF_UNSPEC : constant := 0;
   PF_LOCAL  : constant := 1;
   PF_UNIX   : constant := 1;
   PF_INET   : constant := 2;
   PF_OSI    : constant := 19;
   --  *** MISSING: PF_ISO ***  --
   PF_ISO    : constant := 0;

   IPPROTO_IP   : constant := 0;
   IPPROTO_ICMP : constant := 1;
   IPPROTO_TCP  : constant := 6;
   IPPROTO_UDP  : constant := 17;
   IPPROTO_RAW  : constant := 255;


   procedure Accept_Connection_Procedure (
      Socket       : in POSIX_IO.File_Descriptor;
      Address      : in Socket_Address_Pointer
                   := Null_Socket_Address;
      Expected     : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Accept_Connection_Function (
      Socket       : in POSIX_IO.File_Descriptor;
      Expected     : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Receive1_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Receive2_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Receive3_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      From     : in Socket_Address_Pointer
               := Null_Socket_Address;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Receive4_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      From     : in Socket_Address_Pointer
               := Null_Socket_Address;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Receive_Message1_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String);

   procedure Accept_Connection_Procedure (
      Socket   : in POSIX_IO.File_Descriptor;
      Address  : in Socket_Address_Pointer
               := Null_Socket_Address;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Connection_Socket : POSIX_IO.File_Descriptor := 0;
      Int_Add           : aliased Internet_Socket_Address;
      Connect_Name      : Socket_Address_Pointer :=
         +(Int_Add'Unchecked_Access);
   begin
      if Address /= Null_Socket_Address then
         Connect_Name := Address;
      end if;
      Accept_Connection (Socket, Connection_Socket, Connect_Name);
      if Er1 /= "A000" then
         Expect_Exception (Er1);
      else
         Assert (Connection_Socket /= 0, Er2);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Accept_Connection_Procedure;

   procedure Accept_Connection_Function (
      Socket   : in POSIX_IO.File_Descriptor;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Connection_Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Connection_Socket := Accept_Connection (Socket);
      if Er1 /= "A000" then
         Expect_Exception (Er1);
      else
         Assert (Connection_Socket /= 0, Er2);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Accept_Connection_Function;

   procedure Receive1_Tests (
      Socket    : in POSIX_IO.File_Descriptor;
      Options   : in Message_Option_Set := Empty_Set;
      Expected  : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Octets    : POSIX_String (1 .. 40);
      Buffer    : System.Address := Octets'Address;
      Requested : POSIX.IO_Count := 40;
      Received  : POSIX.IO_Count := 0;
      Mask      : POSIX.Signal_Masking := All_Signals;
   begin
      Comment ("Receive 1");
      Receive (Socket, Buffer, Requested, Received, Mask, Options);
      Comment ("received octets = " &
         Integer'Image (Integer (Received)));
      if Er1 = "A000" then
         Assert (Received = 4 and Octets (1 .. 4) = "test", Er2);
      else
         Expect_Exception (Er1);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Receive1_Tests;

   procedure Receive2_Tests (
      Socket    : in POSIX_IO.File_Descriptor;
      Options   : in Message_Option_Set := Empty_Set;
      Expected  : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Octets    : POSIX_String (1 .. 40);
      Buffer    : System.Address := Octets'Address;
      Requested : POSIX.IO_Count := 40;
      Received  : POSIX.IO_Count := 0;
   begin
      Comment ("Receive 2");
      Receive (Socket, Buffer, Requested, Received, Options);
      Comment ("received octets = " &
         Integer'Image (Integer (Received)));
      if Er1 = "A000" then
         Assert (Received = 4 and Octets (1 .. 4) = "test", Er2);
      else
         Expect_Exception (Er1);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Receive2_Tests;

   procedure Receive3_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      From     : in Socket_Address_Pointer
               := Null_Socket_Address;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Octets    : POSIX_String (1 .. 40);
      Buffer    : System.Address := Octets'Address;
      Requested : POSIX.IO_Count := 40;
      Received  : POSIX.IO_Count := 0;
      Mask      : POSIX.Signal_Masking := All_Signals;
   begin
      Comment ("Receive 3");
      Receive (Socket, Buffer, Requested, Received, From,
         Mask, Options);
      Comment ("received octets = " &
         Integer'Image (Integer (Received)));
      if Er1 = "A000" then
         Assert (Received = 4 and Octets (1 .. 4) = "test", Er2);
      else
         Expect_Exception (Er1);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Receive3_Tests;

   procedure Receive4_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      From     : in Socket_Address_Pointer
               := Null_Socket_Address;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Octets    : POSIX_String (1 .. 40);
      Buffer    : System.Address := Octets'Address;
      Requested : POSIX.IO_Count := 40;
      Received  : POSIX.IO_Count := 0;
   begin
      Comment ("Receive 4");
      Receive (Socket, Buffer, Requested, Received, From,
         Options);
      Comment ("received octets = " &
         Integer'Image (Integer (Received)));
      if Er1 = "A000" then
         Assert (Received = 4 and Octets (1 .. 4) = "test", Er2);
      else
         Expect_Exception (Er1);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Receive4_Tests;

   procedure Receive_Message1_Tests (
      Socket   : in POSIX_IO.File_Descriptor;
      Options  : in Message_Option_Set := Empty_Set;
      Expected : in Error_Code := No_Error;
      Er1, Er2, Er3, Er4 : in String)
   is
      Message  : Socket_Message;
      Received : POSIX.IO_Count := 0;
      Mask     : POSIX.Signal_Masking := All_Signals;
   begin
      Comment ("Receive Message 1");
      Receive_Message (Socket, Message, Received, Mask, Options);
      Comment ("received octets = " &
         Integer'Image (Integer (Received)));
      if Er1 = "A000" then
         Assert (Received /= 0, Er2);
      else
         Expect_Exception (Er1);
      end if;
   exception
   when E1 : POSIX_Error =>
      if Get_Error_Code /= Expected then
         Unexpected_Exception (E1, Er3);
      end if;
   when E2 : others => Unexpected_Exception (E2, Er4);
   end Receive_Message1_Tests;



--------------------------------------------------------------------------
--  Begin Tests

begin
   Header ("p180402");
   Test ("package POSIX.Sockets");

   -----------------------------------------------------------------------
   --  Accept an incoming connection

   Test ("Accept_Connection Procedure [18.4.2]");
   declare
      Socket   : POSIX_IO.File_Descriptor;
      Port     : Positive;
      Template : Process_Template;
      Child    : Process_ID;
      List     : POSIX_String_List;
      Int_Add  : aliased Internet_Socket_Address;
      Name     : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      Listen (Socket);
      POSIX.Append (List, "p180402a");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402a", Template, List);
      Close_Template (Template);
      Accept_Connection_Procedure (Socket, Er1 => "A000",
         Er2 =>  "A001", Er3 => "A002", Er4 => "A003");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  An address object of an incorrect type for the address format of
   --  this socket raises the Incorrect_Address_Type error code.

   --  ... Shoud be able to get the correct error when other protocols
   --  ... can be used.

   Test ("Incorrect_Address_Type [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
      Junk    : Internet_Address;
      Address : Socket_Address_Pointer;
      function To_Socket_Address_Pointer is new
         Unchecked_Conversion (System.Address,
         Socket_Address_Pointer);
      Int_Add : aliased Internet_Socket_Address;
      Name    : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Address := To_Socket_Address_Pointer (Junk'Address);
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Listen (Socket);
      Accept_Connection_Procedure (Socket, Address => Address,
--         Expected => Incorrect_Address_Type,
         Er1 => "A004", Er2 =>  "A005", Er3 => "A006", Er4 => "A007");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection on a closed socket results in the
   --  Bad_File_Descriptor error code.

   Test ("Bad_File_Descriptor [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Close (Socket);
      Accept_Connection_Procedure (Socket,
         Expected => Bad_File_Descriptor,
         Er1 => "A008", Er2 =>  "A009", Er3 => "A010", Er4 => "A011");
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from a non listening socket
   --  raises the Invalid_Argument error code.

   Test ("Invalid_Argument [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
      Int_Add : aliased Internet_Socket_Address;
      Name    : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Accept_Connection_Procedure (Socket,
         Expected => Invalid_Argument,
         Er1 => "A012", Er2 =>  "A013", Er3 => "A014", Er4 => "A015");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from a non-socket
   --  raises the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor := 0;
   begin
      Accept_Connection_Procedure (Socket,
         Expected => Not_A_Socket,
         Er1 => "A016", Er2 =>  "A017", Er3 => "A018", Er4 => "A019");
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from an socket that does not support
   --  the Accept_Connection operation raises the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Accept_Connection_Procedure (Socket,
         Expected => Option_Not_Supported,
         Er1 => "A020", Er2 =>  "A021", Er3 => "A022", Er4 => "A023");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket will cause the Would_Block error code
   --  when Accept_Connection would normaly block.

   Test ("Would_Block [18.4.2.3]");
   declare
      Socket   : POSIX_IO.File_Descriptor;
      Int_Add  : aliased Internet_Socket_Address;
      Name     : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Set_File_Control (Socket, Non_Blocking);
      Bind (Socket, +Name);
      Listen (Socket);
      Accept_Connection_Procedure (Socket,
         Expected => Would_Block,
         Er1 => "A666", Er2 =>  "A001",
         Er3 => "A002", Er4 => "A003");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  Accept an incoming connection

   Test ("Accept_Connection Function [18.4.2]");
   declare
      Socket   : POSIX_IO.File_Descriptor;
      Port     : Positive;
      Template : Process_Template;
      Child    : Process_ID;
      List     : POSIX_String_List;
      Int_Add  : aliased Internet_Socket_Address;
      Name     : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      Listen (Socket);
      POSIX.Append (List, "p180402a");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402a", Template, List);
      Close_Template (Template);
      Accept_Connection_Function (Socket, Er1 => "A000",
         Er2 =>  "A001", Er3 => "A002", Er4 => "A003");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection on a closed socket results in the
   --  Bad_File_Descriptor error code.

   Test ("Bad_File_Descriptor [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Close (Socket);
      Accept_Connection_Function (Socket,
         Expected => Bad_File_Descriptor,
         Er1 => "A008", Er2 =>  "A009", Er3 => "A010", Er4 => "A011");
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from a non listening socket
   --  raises the Invalid_Argument error code.

   Test ("Invalid_Argument [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
      Int_Add : aliased Internet_Socket_Address;
      Name    : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Accept_Connection_Function (Socket,
         Expected => Invalid_Argument,
         Er1 => "A012", Er2 =>  "A013", Er3 => "A014", Er4 => "A015");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from a non-socket
   --  raises the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor := 0;
   begin
      Accept_Connection_Function (Socket,
         Expected => Not_A_Socket,
         Er1 => "A016", Er2 =>  "A017", Er3 => "A018", Er4 => "A019");
   end;

   -----------------------------------------------------------------------
   --  Trying to accept a connection from an socket that does not support
   --  the Accept_Connection operation raises the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.2.3]");
   declare
      Socket  : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Accept_Connection_Function (Socket,
         Expected => Option_Not_Supported,
         Er1 => "A020", Er2 =>  "A021", Er3 => "A022", Er4 => "A023");
      Close (Socket);
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket will cause the Would_Block error code
   --  when Accept_Connection would normaly block.

   Test ("Would_Block [18.4.2.3]");
   declare
      Socket   : POSIX_IO.File_Descriptor;
      Int_Add  : aliased Internet_Socket_Address;
      Name     : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Set_File_Control (Socket, Non_Blocking);
      Bind (Socket, +Name);
      Listen (Socket);
      Accept_Connection_Function (Socket,
         Expected => Would_Block,
         Er1 => "A024", Er2 =>  "A025",
         Er3 => "A026", Er4 => "A027");
      Close (Socket);
   end;

   --  ===============================================================  --
   --  ==                                                           ==  --
   --  ==  The remaining Accept_Connection errors cannont be tested ==  --
   --  ==  due to their dependence on either system resources or    ==  --
   --  ==  race conditions.                                         ==  --
   --  ==                                                           ==  --
   --  ===============================================================  --

   -----------------------------------------------------------------------
   --  Receive a message sent to local socket

   Test ("Receive 1 [18.4.12]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Port      : Positive;
      Template  : Process_Template;
      Child     : Process_ID;
      List      : POSIX_String_List;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
      Connection_Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      Listen (Socket);
      POSIX.Append (List, "p180402b");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402b", Template, List);
      Close_Template (Template);
      Connection_Socket := Accept_Connection (Socket);
      Receive1_Tests (Connection_Socket, Er1 => "A000",
         Er2 => "A028", Er3 => "A029", Er4 => "A030");
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket that should block on a Receive generates
   --  the Would_Block error code

   Test ("Would_Block [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, 9);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Set_File_Control (Socket, Non_Blocking);
      Connect (Socket, +Name);
      Receive1_Tests (Socket, Expected => Would_Block,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a closed file descriptor generates
   --  the Bad_File_Desriptor error code.

   Test ("Bad_File_Destriptor [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Close (Socket);
      Receive1_Tests (Socket, Expected => Bad_File_Descriptor,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-connected socket generates
   --  the Not_Connected error code.

   Test ("Not_Connected [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Receive1_Tests (Socket, Expected => Not_Connected,
         Er1 => "A035", Er2 => "A036",
         Er3 => "A037", Er4 => "A038");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-socket generates
   --  the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 1;
   begin
      Receive1_Tests (Socket, Expected => Not_A_Socket,
         Er1 => "A039", Er2 => "A040",
         Er3 => "A041", Er4 => "A042");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive using the Process_OOB_Data option on a socket
   --  type that doesn't allow it generate the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Receive1_Tests (Socket, Options => Process_OOB_Data,
         Expected => Option_Not_Supported,
         Er1 => "A043", Er2 => "A044",
         Er3 => "A045", Er4 => "A046");
   end;

   -----------------------------------------------------------------------
   --  Receive a message sent to local socket

   Test ("Receive 2 [18.4.12]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Port      : Positive;
      Template  : Process_Template;
      Child     : Process_ID;
      List      : POSIX_String_List;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
      Connection_Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      Listen (Socket);
      POSIX.Append (List, "p180402b");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402b", Template, List);
      Close_Template (Template);
      Connection_Socket := Accept_Connection (Socket);
      Receive2_Tests (Connection_Socket, Er1 => "A000",
         Er2 => "A028", Er3 => "A029", Er4 => "A030");
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket that should block on a Receive generates
   --  the Would_Block error code

   Test ("Would_Block [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, 9);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Set_File_Control (Socket, Non_Blocking);
      Connect (Socket, +Name);
      Receive2_Tests (Socket, Expected => Would_Block,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a closed file descriptor generates
   --  the Bad_File_Desriptor error code.

   Test ("Bad_File_Destriptor [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Close (Socket);
      Receive2_Tests (Socket, Expected => Bad_File_Descriptor,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-connected socket generates
   --  the Not_Connected error code.

   Test ("Not_Connected [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Receive2_Tests (Socket, Expected => Not_Connected,
         Er1 => "A035", Er2 => "A036",
         Er3 => "A037", Er4 => "A038");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-socket generates
   --  the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 1;
   begin
      Receive2_Tests (Socket, Expected => Not_A_Socket,
         Er1 => "A039", Er2 => "A040",
         Er3 => "A041", Er4 => "A042");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive using the Process_OOB_Data option on a socket
   --  type that doesn't allow it generate the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Receive2_Tests (Socket, Options => Process_OOB_Data,
         Expected => Option_Not_Supported,
         Er1 => "A043", Er2 => "A044",
         Er3 => "A045", Er4 => "A046");
   end;

   -----------------------------------------------------------------------
   --  Receive a message sent to local socket

   Test ("Receive 3 [18.4.12]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Port      : Positive;
      Template  : Process_Template;
      Child     : Process_ID;
      List      : POSIX_String_List;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      POSIX.Append (List, "p180402c");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402c", Template, List);
      Close_Template (Template);
      Receive3_Tests (Socket, From => +Name,
         Er1 => "A000", Er2 => "A028",
         Er3 => "A029", Er4 => "A030");
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket that should block on a Receive generates
   --  the Would_Block error code

   Test ("Would_Block [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, 9);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Set_File_Control (Socket, Non_Blocking);
      Connect (Socket, +Name);
      Receive3_Tests (Socket, Expected => Would_Block,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a closed file descriptor generates
   --  the Bad_File_Desriptor error code.

   Test ("Bad_File_Destriptor [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Close (Socket);
      Receive3_Tests (Socket, Expected => Bad_File_Descriptor,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-connected socket generates
   --  the Not_Connected error code.

   Test ("Not_Connected [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Receive3_Tests (Socket, Expected => Not_Connected,
         Er1 => "A035", Er2 => "A036",
         Er3 => "A037", Er4 => "A038");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-socket generates
   --  the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 1;
   begin
      Receive3_Tests (Socket, Expected => Not_A_Socket,
         Er1 => "A039", Er2 => "A040",
         Er3 => "A041", Er4 => "A042");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive using the Process_OOB_Data option on a socket
   --  type that doesn't allow it generate the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Receive3_Tests (Socket, Options => Process_OOB_Data,
         Expected => Option_Not_Supported,
         Er1 => "A043", Er2 => "A044",
         Er3 => "A045", Er4 => "A046");
   end;

   --  ... Add test for Incorrect_Address_Type here when testing of
   --  ... a non-internet protocol is completed

   -----------------------------------------------------------------------
   --  Receive a message sent to local socket

   Test ("Receive 4 [18.4.12]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Port      : Positive;
      Template  : Process_Template;
      Child     : Process_ID;
      List      : POSIX_String_List;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      POSIX.Append (List, "p180402c");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402c", Template, List);
      Close_Template (Template);
      Receive4_Tests (Socket, From => +Name,
         Er1 => "A000", Er2 => "A028",
         Er3 => "A029", Er4 => "A030");
   end;

   -----------------------------------------------------------------------
   --  A non-blocking socket that should block on a Receive generates
   --  the Would_Block error code

   Test ("Would_Block [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, 9);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Set_File_Control (Socket, Non_Blocking);
      Connect (Socket, +Name);
      Receive4_Tests (Socket, Expected => Would_Block,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a closed file descriptor generates
   --  the Bad_File_Desriptor error code.

   Test ("Bad_File_Destriptor [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 0;
   begin
      Close (Socket);
      Receive4_Tests (Socket, Expected => Bad_File_Descriptor,
         Er1 => "A031", Er2 => "A032",
         Er3 => "A033", Er4 => "A034");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-connected socket generates
   --  the Not_Connected error code.

   Test ("Not_Connected [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Stream_Socket, IPPROTO_TCP);
      Receive4_Tests (Socket, Expected => Not_Connected,
         Er1 => "A035", Er2 => "A036",
         Er3 => "A037", Er4 => "A038");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive on a non-socket generates
   --  the Not_A_Socket error code.

   Test ("Not_A_Socket [18.4.12.3]");
   declare
      Socket : POSIX_IO.File_Descriptor := 1;
   begin
      Receive4_Tests (Socket, Expected => Not_A_Socket,
         Er1 => "A039", Er2 => "A040",
         Er3 => "A041", Er4 => "A042");
   end;

   -----------------------------------------------------------------------
   --  Trying to receive using the Process_OOB_Data option on a socket
   --  type that doesn't allow it generate the
   --  Option_Not_Supported error code.

   Test ("Option_Not_Supported [18.4.12.3]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
   begin
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Receive4_Tests (Socket, Options => Process_OOB_Data,
         Expected => Option_Not_Supported,
         Er1 => "A043", Er2 => "A044",
         Er3 => "A045", Er4 => "A046");
   end;

   --  ... Add test for Incorrect_Address_Type here when testing of
   --  ... a non-internet protocol is completed

   -----------------------------------------------------------------------
   --  Receive a message sent to local socket

   Test ("Receive_Message 1 [18.4.12]");
   declare
      Socket    : POSIX_IO.File_Descriptor;
      Port      : Positive;
      Template  : Process_Template;
      Child     : Process_ID;
      List      : POSIX_String_List;
      Int_Add   : aliased Internet_Socket_Address;
      Name      : Internet_Socket_Address_Pointer :=
         Int_Add'Unchecked_Access;
   begin
      Set_Internet_Port (Int_Add, Unspecified_Internet_Port);
      Set_Internet_Address (Int_Add,
         String_To_Internet_Address ("127.0.0.1"));
      Socket := Create (PF_INET, Datagram_Socket, IPPROTO_UDP);
      Bind (Socket, +Name);
      Port := Integer (Get_Internet_Port (Get_Socket_Name (Socket)));
      POSIX.Append (List, "p180402d");
      POSIX.Append (List, Value (Argument_List, 2));
      POSIX.Append (List, To_POSIX_String (Integer'Image
         (Port)));
      Comment ("port is " & Integer'Image (Port));
      Open_Template (Template);
      Start_Process (Child, "./p180402d", Template, List);
      Close_Template (Template);
      Receive_Message1_Tests (Socket,
         Er1 => "A000", Er2 => "A028",
         Er3 => "A029", Er4 => "A030");
   end;


   Done;
exception when E : others => Fatal_Exception (E, "A999");
end p180402;
