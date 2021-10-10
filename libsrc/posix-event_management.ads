------------------------------------------------------------------------------
--                                                                          --
--   POSIX Ada95 Bindings for Protocol Independent Interfaces (P1003.5c)    --
--                                                                          --
--               P O S I X . E v e n t _ M a n a g e m e n t                --
--                                                                          --
--                                  S p e c                                 --
--                                                                          --
--                                                                          --
--  This file is part of an implementation of an Ada95 API for the sockets  --
--  and network support services found in P1003.1g -- Protocol Independent  --
--  Interfaces.  It is integrated with the  FSU Implementation of POSIX.5b  --
--  (FLORIST), an Ada API for  POSIX OS services for use with the GNAT Ada  --
--  compiler and the FSU Gnu Ada Runtime Library (GNARL).                   --
--                                                                          --
--  This package specification contains some text extracted from  IEEE STD  --
--  1003.5: 1990, Information Technology --  POSIX Ada Language Interfaces  --
--  Part 1:  Binding for System Application Program Interface,  as amended  --
--  by IEEE STD 1003.5b: 1996,  Amendment 1: Realtime  Extensions,  and as  --
--  further amended by IEEE Draft STD 1003.5c: 1997, Amendment 2: Protocol  --
--  Independent Interfaces,  copyright 1997 by the Institute of Electrical  --
--  and Electronics Engineers, Inc.                                         --
--                                                                          --
--  The package specifications in the IEEE standards cited above represent  --
--  only a  portion  of  the  documents  and  are  not to be interpreteted  --
--  outside the context  of  the documents.  The standards must be used in  --
--  conjunction  with  the  package   specifications  in  order  to  claim  --
--  conformance.   The IEEE takes no responsibility for and will assume no  --
--  liability for damages resulting from the reader's misinterpretation of  --
--  said  information resulting from its out-of-context nature.   To order  --
--  copies of the IEEE standards,  please contact the  IEEE Service Center  --
--  at 445 Hoes Lane, PO Box 1331, Piscataway, NJ 08855-1331; via phone at  --
--  1-800-678-IEEE, 908-981-1393; or via fax at 908-981-9667.               --
--                                                                          --
--  These  package  specifications are  distributed in  the hope that they  --
--  will  be useful, but  WITHOUT  ANY  WARRANTY; without even the implied  --
--  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.        --
--                                                                          --
------------------------------------------------------------------------------

with POSIX,
     POSIX.IO,
     POSIX.Signals,
     POSIX.Limits;
with POSIX.C;
package POSIX.Event_Management is

   type Poll_Events is new POSIX.Option_Set;
   Read_Not_High  : constant Poll_Events;
   Read_Normal    : constant Poll_Events;
   Read_Priority  : constant Poll_Events;
   Read_High      : constant Poll_Events;
   Write_Normal   : constant Poll_Events;
   Write_Priority : constant Poll_Events;
   Poll_Error     : constant Poll_Events;
   File_Not_Open  : constant Poll_Events;
   type Poll_FD is private;
   function Get_File (Poll_Item : Poll_FD)
      return POSIX.IO.File_Descriptor;
   procedure Set_File
      (Poll_Item : in out Poll_FD;
       File      :        POSIX.IO.File_Descriptor);
   function Get_Events (Poll_Item : Poll_FD)
      return Poll_Events;
   procedure Set_Events
      (Poll_Item : in out Poll_FD;
       Events    : Poll_Events);
   function Get_Returned_Events (Poll_Item : Poll_FD)
      return Poll_Events;
   procedure Set_Returned_Events
      (Poll_Item : in out Poll_FD;
       Events    :        Poll_Events);
   pragma Warnings (Off, "*obsolescent*");
   subtype Poll_FD_Array_Range is Positive
      range 1 .. POSIX.Open_Files_Maxima'Last;
   pragma Warnings (On, "*obsolescent*");
   type Poll_FD_Array is array
      (Poll_FD_Array_Range range <>) of Poll_FD;
   Wait_Indefinitely : constant Duration;
   procedure Poll
      (Files          : in out Poll_FD_Array;
       Response_Count : out    Natural;
       Timeout        :        Duration := Wait_Indefinitely);

   type File_Descriptor_Set is private;
   Empty_File_Descriptor_Set : constant File_Descriptor_Set;
   procedure Make_Empty (Set : in out File_Descriptor_Set);
   subtype Select_File_Descriptor is POSIX.IO.File_Descriptor
      range POSIX.IO.File_Descriptor'First .. POSIX.IO.File_Descriptor
            (POSIX.Limits.FD_Set_Maxima'Last - 1);
   procedure Add
      (Set  : in out File_Descriptor_Set;
       File :        Select_File_Descriptor);
   procedure Remove
      (Set  : in out File_Descriptor_Set;
       File :        Select_File_Descriptor);
   function In_Set
      (Set  : File_Descriptor_Set;
       File : Select_File_Descriptor)
      return Boolean;
   procedure Select_File
      (Read_Files     : in out File_Descriptor_Set;
       Write_Files    : in out File_Descriptor_Set;
       Except_Files   : in out File_Descriptor_Set;
       Files_Selected :    out Natural;
       Timeout        :        Duration := Wait_Indefinitely);
   procedure Select_File
      (Read_Files     : in out File_Descriptor_Set;
       Write_Files    : in out File_Descriptor_Set;
       Except_Files   : in out File_Descriptor_Set;
       Files_Selected :    out Natural;
       Signals        :        POSIX.Signals.Signal_Set;
       Timeout        :        Duration := Wait_Indefinitely);
   generic
      with procedure Action
         (File :        Select_File_Descriptor;
          Quit : in out Boolean);
   procedure For_Every_File_In (Set : File_Descriptor_Set);

private

   type Poll_FD is record
      C : aliased POSIX.C.struct_pollfd;
   end record;

   type File_Descriptor_Set is record
      C    : aliased POSIX.C.fd_set;
   end record;

   Empty_File_Descriptor_Set : constant File_Descriptor_Set :=
      (C    => (others => 0));

   use POSIX.C;

   Read_Not_High  : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLIN));
   Read_Normal    : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLRDNORM));
   Read_Priority  : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLRDBAND));
   Read_High      : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLPRI));
   Write_Normal   : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLWRNORM));
   Write_Priority : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLWRBAND));
   Poll_Error     : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLERR));
   File_Not_Open  : constant Poll_Events :=
      Poll_Events (POSIX.Option_Set'(Option => POLLNVAL));

   Wait_Indefinitely : constant Duration := -1.0;  --  Don't rely on non standard INFTIM

end POSIX.Event_Management;
