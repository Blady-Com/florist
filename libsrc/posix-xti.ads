------------------------------------------------------------------------------
--                                                                          --
--   POSIX Ada95 Bindings for Protocol Independent Interfaces (P1003.5c)    --
--                                                                          --
--                             P O S I X . X T I                            --
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
--  only a  portion  of  the  documents  and  are  not  to  be interpreted  --
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
     POSIX_IO,
     POSIX_Limits,
     POSIX.C,
     System;
package POSIX.XTI is

   type XTI_Flags is new POSIX.Option_Set;
   Expedited_Data      : constant XTI_Flags;
   More_Data           : constant XTI_Flags;
   Push_Data           : constant XTI_Flags;

   type Options_Flags is private;
   Check_Options       : constant Options_Flags;
   Get_Current_Options : constant Options_Flags;
   Get_Default_Options : constant Options_Flags;
   Negotiate_Options   : constant Options_Flags;

   type Communications_Provider_Info is private;
   type Communications_Provider_Info_Pointer is  --  Added
     access all Communications_Provider_Info;

   type CP_Flags is new POSIX.Option_Set;
   Orderly_Release_Data_Supported : constant CP_Flags;
   Zero_Length_SDU_Supported      : constant CP_Flags;

   type Service_Type is private;
   Connection_Mode                      : constant Service_Type;
   Connection_Mode_With_Orderly_Release : constant Service_Type;
   Connectionless_Mode                  : constant Service_Type;

   function Protocol_Addresses_Are_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_Protocol_Address
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function Protocol_Options_Are_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_Protocol_Options
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function SDU_Is_Supported
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function SDU_Is_Infinite
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function SDU_Is_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_SDU
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function SEDU_Is_Supported
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function SEDU_Is_Infinite
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function SEDU_Is_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_SEDU
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function Connect_Data_Is_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_Connect_Data
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function Disconnect_Data_Is_Valid
      (Info_Item : Communications_Provider_Info)
     return Boolean;
   function Get_Max_Size_Disconnect_Data
      (Info_Item : Communications_Provider_Info)
     return Positive;
   function Get_CP_Flags
      (Info_Item : Communications_Provider_Info)
     return CP_Flags;
   function Get_Service_Type
      (Info_Item : Communications_Provider_Info)
     return Service_Type;

   type XTI_Address_Pointer is private;

   --  There are no general XTI_Address objects
   --  so we export only the pointer type, to which
   --  the various implementations provide conversions
   --  for the specific XTI address types.

   Null_XTI_Address : constant XTI_Address_Pointer;

   type Linger_Info is private;
   subtype Linger_Time is Seconds range 1 .. Seconds'Last;
   type Linger_Option is (Linger_Off, Linger_On);
   function Get_Status (Item : Linger_Info)
     return Linger_Option;
   procedure Set_Status
      (Item   : in out Linger_Info;
       Linger : Linger_Option);
   function Period_Is_Infinite (Item : Linger_Info)
     return Boolean;
   function Period_Is_Unspecified (Item : Linger_Info)
     return Boolean;
   function Get_Period (Item : Linger_Info)
     return Linger_Time;
   procedure Set_Period_Infinite
      (Item : in out Linger_Info);
   procedure Set_Period_Unspecified
      (Item : in out Linger_Info);
   procedure Set_Period
      (Item : in out Linger_Info;
       Time :        Linger_Time);

   type Protocol_Option is private;
   type Option_Value is range Integer'First .. Integer'Last;
   for Option_Value'Size use Integer'Size;  --  Added
   type Option_Level is range 0 .. Integer'Last;
   for Option_Level'Size use Integer'Size;  --  Added
   type Option_Name is range 0 .. Integer'Last;
   for Option_Name'Size use Integer'Size;  --  Added
   type Option_Status is private;
   Success         : constant Option_Status;
   Partial_Success : constant Option_Status;
   Failure         : constant Option_Status;
   Read_Only       : constant Option_Status;
   Not_Supported   : constant Option_Status;
   type Option_Value_Array is array (Positive range <>) of Option_Value;
   function Get_Level (Option_Item : Protocol_Option)
     return Option_Level;
   function Get_Name (Option_Item : Protocol_Option)
     return Option_Name;
   function Get_Status (Option_Item : Protocol_Option)
     return Option_Status;
   function Get_Value (Option_Item : Protocol_Option)
     return Option_Value;
   function Get_Value (Option_Item : Protocol_Option)
     return Option_Value_Array;
   function Get_Value (Option_Item : Protocol_Option)
     return Linger_Info;
   procedure Set_Option
      (Option_Item : in out Protocol_Option;
       Level       :        Option_Level;
       Name        :        Option_Name);
   procedure Set_Option
      (Option_Item : in out Protocol_Option;
       Level       :        Option_Level;
       Name        :        Option_Name;
       Value       :        Option_Value);
   procedure Set_Option
      (Option_Item : in out Protocol_Option;
       Level       :        Option_Level;
       Name        :        Option_Name;
       Value       :        Option_Value_Array);
   procedure Set_Option
      (Option_Item : in out Protocol_Option;
       Level       :        Option_Level;
       Name        :        Option_Name;
       Value       :        Linger_Info);

   type Protocol_Option_List is private;
   type Protocol_Option_List_Pointer is
     access all Protocol_Option_List;
   procedure Make_Empty
      (Info_Item : in out Protocol_Option_List);
   procedure Append
      (Info_Item : in out Protocol_Option_List;
       Option    :        Protocol_Option);
   type Octet_Buffer_Pointer is access all POSIX.Octet_Array;
   procedure Set_Buffer
      (Info_Item      : in out Protocol_Option_List;
       Options_Buffer :        Octet_Buffer_Pointer);
   generic
      with procedure Action
        (Info :        Protocol_Option;
         Quit : in out Boolean);
   procedure For_Every_Item (Info_Item : Protocol_Option_List);
   function Number_Of_Options (Info_Item : Protocol_Option_List)
     return Natural;
   procedure Get_Option
      (Info_Item     :     Protocol_Option_List;
       Option_Number :     Positive;
       Option        : out Protocol_Option);

   type Reason_Code is range 0 .. Integer'Last;

   type Connection_Info is limited private;
   type Connection_Info_Pointer is  --  Added
     access all Connection_Info;

   procedure Set_Address
      (Info_Item  : in out Connection_Info;
       Address    :        XTI_Address_Pointer);
   function Get_Options (Info_Item : Connection_Info)
     return Protocol_Option_List;
   procedure Set_Options
      (Info_Item : in out Connection_Info;
       Options   :        Protocol_Option_List_Pointer);
   procedure Set_User_Data
      (Info_Item  : in out Connection_Info;
       User_Data  :        System.Address;
       Max_Length :        POSIX.IO_Count);
   --  implictly sets Length = Max_Length
   procedure Set_User_Data_Length
      (Info_Item  : in out Connection_Info;
       Length     :        POSIX.IO_Count);
   function Get_User_Data_Length
      (Info_Item : Connection_Info)
     return POSIX.IO_Count;

   function Get_Sequence_Number (Info_Item : Connection_Info)
     return Integer;
   procedure Set_Sequence_Number
      (Info_Item : in out Connection_Info;
       Number    :        Integer);

   subtype IO_Vector_Range is Positive range
      1 .. POSIX_Limits.XTI_IO_Vector_Maxima'Last;
   type IO_Vector_Array is array
      (IO_Vector_Range range <>) of POSIX_IO.IO_Vector;

   type Interface_State is private;
   Uninitialized    : constant Interface_State;
   Unbound          : constant Interface_State;
   Idle             : constant Interface_State;
   Outgoing_Connect : constant Interface_State;
   Incoming_Connect : constant Interface_State;
   Data_Transfer    : constant Interface_State;
   Outgoing_Release : constant Interface_State;
   Incoming_Release : constant Interface_State;

   procedure Accept_Connection
      (Listening_Endpoint  : POSIX_IO.File_Descriptor;
       Responding_Endpoint : POSIX_IO.File_Descriptor;
       Call                : Connection_Info);
   procedure Accept_Connection
      (Listening_Endpoint  : POSIX_IO.File_Descriptor;
       Responding_Endpoint : POSIX_IO.File_Descriptor);

   procedure Acknowledge_Orderly_Release
      (Endpoint : POSIX_IO.File_Descriptor);
   procedure Acknowledge_Orderly_Release
      (Endpoint :     POSIX_IO.File_Descriptor;
       Reason   : out Reason_Code);

   procedure Acknowledge_Orderly_Release_With_Data
      (Endpoint         :     POSIX_IO.File_Descriptor;
       Reason           : out Reason_Code;
       User_Data        :     System.Address;
       Octets_Requested :     POSIX.IO_Count;
       Octets_Received  : out POSIX.IO_Count);

   procedure Bind
      (Endpoint              :     POSIX_IO.File_Descriptor;
       Request_Address       :     XTI_Address_Pointer;
       Request_Queue_Length  :     Natural;
       Response_Address      :     XTI_Address_Pointer;
       Response_Queue_Length : out Natural);
   procedure Bind
      (Endpoint              :     POSIX_IO.File_Descriptor;
       Request_Queue_Length  :     Natural;
       Response_Address      :     XTI_Address_Pointer;
       Response_Queue_Length : out Natural);
   procedure Bind
      (Endpoint             : POSIX_IO.File_Descriptor;
       Request_Address      : XTI_Address_Pointer;
       Request_Queue_Length : Natural);
   procedure Bind
      (Endpoint         : POSIX_IO.File_Descriptor;
       Response_Address : XTI_Address_Pointer);
   procedure Bind
      (Endpoint : POSIX_IO.File_Descriptor);

   procedure Close
      (Endpoint : POSIX_IO.File_Descriptor);

   procedure Confirm_Connection
      (Endpoint :        POSIX_IO.File_Descriptor;
       Call     : in out Connection_Info);
   procedure Confirm_Connection
      (Endpoint : POSIX_IO.File_Descriptor);

   procedure Connect
      (Endpoint :        POSIX_IO.File_Descriptor;
       Send     :        Connection_Info;
       Receive  : in out Connection_Info);
   procedure Connect
      (Endpoint : POSIX_IO.File_Descriptor;
       Send     : Connection_Info);

   procedure Gather_And_Send_Data
      (Endpoint        :     POSIX_IO.File_Descriptor;
       Vector          :     IO_Vector_Array;
       Flags           :     XTI_Flags;
       Octets_Sent     : out POSIX.IO_Count);

   procedure Gather_And_Send_Data_Unit
      (Endpoint        : POSIX_IO.File_Descriptor;
       Address         : XTI_Address_Pointer;
       Vector          : IO_Vector_Array);
   procedure Gather_And_Send_Data_Unit
      (Endpoint        : POSIX_IO.File_Descriptor;
       Address         : XTI_Address_Pointer;
       Vector          : IO_Vector_Array;
       Options         : Protocol_Option_List);

   function Get_Current_State (Endpoint : POSIX_IO.File_Descriptor)
     return Interface_State;

   procedure Get_Info
      (Endpoint :     POSIX_IO.File_Descriptor;
       Info     : out Communications_Provider_Info);

   procedure Get_Protocol_Address
      (Endpoint      : POSIX_IO.File_Descriptor;
       Bound_Address : XTI_Address_Pointer;
       Peer_Address  : XTI_Address_Pointer);

   procedure Initiate_Orderly_Release
      (Endpoint : POSIX_IO.File_Descriptor);
   procedure Initiate_Orderly_Release
      (Endpoint : POSIX_IO.File_Descriptor;
       Reason   : Reason_Code);

   procedure Initiate_Orderly_Release_With_Data
      (Endpoint       : POSIX_IO.File_Descriptor;
       Reason         : Reason_Code;
       User_Data      : System.Address;
       Octets_To_Send : POSIX.IO_Count);

   procedure Listen
      (Endpoint :        POSIX_IO.File_Descriptor;
       Call     : in out Connection_Info);

   type XTI_Events is new POSIX.Option_Set;
   Connect_Request_Received    : constant XTI_Events;
   Connect_Response_Received   : constant XTI_Events;
   Disconnect_Request_Received : constant XTI_Events;
   Error_In_Previously_Sent_Datagram :
                                 constant XTI_Events;
   Expedited_Data_Received     : constant XTI_Events;
   Normal_Data_Received        : constant XTI_Events;
   Okay_To_Send_Expedited_Data : constant XTI_Events;
   Okay_To_Send_Normal_Data    : constant XTI_Events;
   Orderly_Release_Request_Received :
                                 constant XTI_Events;

   function Look (Endpoint : POSIX_IO.File_Descriptor)
     return XTI_Events;

   XTI_Protocol_Level     : constant Option_Level := POSIX.C.XTI.XTI_GENERIC;
   Unspecified            : constant Option_Value := POSIX.C.XTI.T_UNSPEC;
   All_Options            : constant Option_Name := POSIX.C.XTI.T_ALLOPT;
   Enable_Debugging       : constant Option_Name := POSIX.C.XTI.XTI_DEBUG;
   Linger_On_Close_If_Data_Present
                          : constant Option_Name := POSIX.C.XTI.XTI_LINGER;
   Receive_Buffer_Size    : constant Option_Name := POSIX.C.XTI.XTI_RCVBUF;
   Receive_Low_Water_Mark : constant Option_Name := POSIX.C.XTI.XTI_RCVLOWAT;
   Send_Buffer_Size       : constant Option_Name := POSIX.C.XTI.XTI_SNDBUF;
   Send_Low_Water_Mark    : constant Option_Name := POSIX.C.XTI.XTI_SNDLOWAT;
   procedure Manage_Options
      (Endpoint       :        POSIX_IO.File_Descriptor;
       Request        :        Protocol_Option_List;
       Request_Flag   :        Options_Flags;
       Response       : in out Protocol_Option_List;
       Response_Flags : out    Option_Status);

   procedure Open
      (Endpoint : out    POSIX_IO.File_Descriptor;
       Name     :        POSIX.POSIX_String;
       Mode     :        POSIX_IO.File_Mode;
       Options  :        POSIX_IO.Open_Option_Set;
       Info     : in out Communications_Provider_Info);
   procedure Open
      (Endpoint : out POSIX_IO.File_Descriptor;
       Name     :     POSIX.POSIX_String;
       Mode     :     POSIX_IO.File_Mode;
       Options  :     POSIX_IO.Open_Option_Set);

   procedure Receive
      (Endpoint         :     POSIX_IO.File_Descriptor;
       Buffer           :     System.Address;
       Octets_Requested :     POSIX.IO_Count;
       Octets_Received  : out POSIX.IO_Count;
       Flags            : out XTI_Flags);

   procedure Receive_And_Scatter_Data
      (Endpoint          :     POSIX_IO.File_Descriptor;
       Vector            :     IO_Vector_Array;
       Octets_Received   : out POSIX.IO_Count;
       Flags             : out XTI_Flags);

   procedure Receive_And_Scatter_Data_Unit
      (Endpoint          :        POSIX_IO.File_Descriptor;
       Address           :        XTI_Address_Pointer;
       Options           : in out Protocol_Option_List;
       Vector            :        IO_Vector_Array;
       Octets_Received   : out    POSIX.IO_Count;
       Flags             : out    XTI_Flags);

   procedure Receive_Data_Unit
      (Endpoint         :        POSIX_IO.File_Descriptor;
       User_Data        :        System.Address;
       Octets_Requested :        POSIX.IO_Count;
       Octets_Received  : out    POSIX.IO_Count;
       Address          :        XTI_Address_Pointer;
       Options          : in out Protocol_Option_List;
       Flags            : out    XTI_Flags);
   procedure Receive_Data_Unit
      (Endpoint         :     POSIX_IO.File_Descriptor;
       User_Data        :     System.Address;
       Octets_Requested :     POSIX.IO_Count;
       Octets_Received  : out POSIX.IO_Count;
       Address          :     XTI_Address_Pointer;
       Flags            : out XTI_Flags);

   type Unit_Data_Error_Code is new Integer;
   procedure Retrieve_Data_Unit_Error
      (Endpoint :        POSIX_IO.File_Descriptor;
       Address  :        XTI_Address_Pointer;
       Options  : in out Protocol_Option_List;
       Error    : out    Unit_Data_Error_Code);
   procedure Retrieve_Data_Unit_Error
      (Endpoint :     POSIX_IO.File_Descriptor;
       Address  :     XTI_Address_Pointer;
       Error    : out Unit_Data_Error_Code);
   procedure Retrieve_Data_Unit_Error
      (Endpoint :        POSIX_IO.File_Descriptor;
       Options  : in out Protocol_Option_List;
       Error    : out    Unit_Data_Error_Code);
   procedure Retrieve_Data_Unit_Error
      (Endpoint :     POSIX_IO.File_Descriptor;
       Error    : out Unit_Data_Error_Code);

   procedure Retrieve_Disconnect_Info
      (Endpoint         :     POSIX_IO.File_Descriptor;
       User_Data        :     System.Address;
       Octets_Requested :     POSIX.IO_Count;
       Octets_Retrieved : out POSIX.IO_Count;
       Reason           : out Reason_Code;
       Sequence_Number  : out Natural);
   procedure Clear_Disconnect_Info
      (Endpoint : POSIX_IO.File_Descriptor);

   procedure Send
      (Endpoint       :     POSIX_IO.File_Descriptor;
       Buffer         :     System.Address;
       Octets_To_Send :     POSIX.IO_Count;
       Flags          :     XTI_Flags;
       Octets_Sent    : out POSIX.IO_Count);

   procedure Send_Data_Unit
      (Endpoint       : POSIX_IO.File_Descriptor;
       User_Data      : System.Address;
       Octets_To_Send : POSIX.IO_Count;
       Address        : XTI_Address_Pointer;
       Options        : Protocol_Option_List);
   procedure Send_Data_Unit
      (Endpoint       : POSIX_IO.File_Descriptor;
       User_Data      : System.Address;
       Octets_To_Send : POSIX.IO_Count;
       Address        : XTI_Address_Pointer);

   procedure Send_Disconnect_Request
      (Endpoint : POSIX_IO.File_Descriptor;
       Call     : Connection_Info);
   procedure Send_Disconnect_Request
      (Endpoint : POSIX_IO.File_Descriptor);
   procedure Send_Disconnect_Request
      (Endpoint        : POSIX_IO.File_Descriptor;
       Sequence_Number : Natural);
   procedure Send_Disconnect_Request
      (Endpoint       : POSIX_IO.File_Descriptor;
       User_Data      : System.Address;
       Octets_To_Send : POSIX.IO_Count);

   function Synchronize_Endpoint
      (Endpoint : POSIX_IO.File_Descriptor)
     return Interface_State;

   procedure Unbind
      (Endpoint : POSIX_IO.File_Descriptor);

private

   type Options_Flags is new POSIX.C.int;
   Check_Options       : constant Options_Flags :=
     POSIX.C.XTI.T_CHECK;
   Get_Current_Options : constant Options_Flags :=
     POSIX.C.XTI.T_CURRENT;
   Get_Default_Options : constant Options_Flags :=
     POSIX.C.XTI.T_DEFAULT;
   Negotiate_Options   : constant Options_Flags :=
     POSIX.C.XTI.T_NEGOTIATE;

   type Option_Status is new POSIX.C.int;
   Success         : constant Option_Status :=
     POSIX.C.XTI.T_SUCCESS;
   Partial_Success : constant Option_Status :=
     POSIX.C.XTI.T_PARTSUCCESS;
   Failure         : constant Option_Status :=
     POSIX.C.XTI.T_FAILURE;
   Read_Only       : constant Option_Status :=
     POSIX.C.XTI.T_READONLY;
   Not_Supported   : constant Option_Status :=
     POSIX.C.XTI.T_NOTSUPPORT;

   type Service_Type is new POSIX.C.int;
   Connection_Mode                      : constant Service_Type :=
     POSIX.C.XTI.T_COTS;
   Connection_Mode_With_Orderly_Release : constant Service_Type :=
     POSIX.C.XTI.T_COTS_ORD;
   Connectionless_Mode                  : constant Service_Type :=
     POSIX.C.XTI.T_CLTS;

   type Interface_State is new POSIX.C.int;
   Uninitialized    : constant Interface_State :=
     POSIX.C.XTI.T_UNINIT;
   Unbound          : constant Interface_State :=
     POSIX.C.XTI.T_UNBND;
   Idle             : constant Interface_State :=
     POSIX.C.XTI.T_IDLE;
   Outgoing_Connect : constant Interface_State :=
     POSIX.C.XTI.T_OUTCON;
   Incoming_Connect : constant Interface_State :=
     POSIX.C.XTI.T_INCON;
   Data_Transfer    : constant Interface_State :=
     POSIX.C.XTI.T_DATAXFER;
   Outgoing_Release : constant Interface_State :=
     POSIX.C.XTI.T_OUTREL;
   Incoming_Release : constant Interface_State :=
     POSIX.C.XTI.T_INREL;

   type Communications_Provider_Info is record
      C : aliased POSIX.C.XTI.struct_t_info;
   end record;

   type XTI_Address is record
      netbuf : aliased POSIX.C.XTI.struct_netbuf :=
        POSIX.C.XTI.struct_netbuf'(len     => 0,
                                   maxlen  => 0,
                                   buf     => null);
      buf_ptr : aliased POSIX.C.char_ptr;
      --  .... do we still need the above?
   end record;

   type XTI_Address_Pointer is access all XTI_Address;
   Null_XTI_Address : constant XTI_Address_Pointer := null;
   pragma No_Strict_Aliasing (XTI_Address_Pointer);

   type Linger_Info is record
      C : aliased POSIX.C.XTI.struct_t_linger :=
        POSIX.C.XTI.struct_t_linger'(l_onoff  => POSIX.C.XTI.T_NO,
                                     l_linger => 0);
   end record;

   type Protocol_Option_List is record
      C : aliased POSIX.C.XTI.struct_netbuf :=
        POSIX.C.XTI.struct_netbuf'(len    => 0,
                                   maxlen => 0,
                                   buf    => null);
      buf_ptr : aliased Octet_Buffer_Pointer;
   end record;

   type Connection_Info is record
      C : aliased POSIX.C.XTI.struct_t_call :=
        POSIX.C.XTI.struct_t_call'(addr     =>  (len    => 0,
                                                 maxlen => 0,
                                                 buf    => null),
                                   opt      =>   (len    => 0,
                                                  maxlen => 0,
                                                  buf    => null),
                                   udata    => (len    => 0,
                                                maxlen => 0,
                                                buf    => null),
                                   sequence => 0);
      addr_buf_ptr : aliased POSIX.C.char_ptr;
      --  .... do we still need the above?
      opt_buf_ptr : aliased Octet_Buffer_Pointer;
      udata_buf_ptr : aliased POSIX.C.char_ptr;
      --  .... do we still need the above?
   end record;

   type Protocol_Option is record
      C    : aliased POSIX.C.XTI.struct_t_opthdr :=
             POSIX.C.XTI.struct_t_opthdr'(len    => 0,
                                          level  => 0,
                                          name   => 0,
                                          status => 0);
      Data : aliased POSIX.Octet_Array (1 .. 100) :=
              (others => 0);
   end record;

   Expedited_Data :      constant XTI_Flags :=
      XTI_Flags (POSIX.Option_Set'(Option => POSIX.C.XTI.T_EXPEDITED));
   More_Data :           constant XTI_Flags :=
      XTI_Flags (POSIX.Option_Set'(Option => POSIX.C.XTI.T_MORE));
   Push_Data :           constant XTI_Flags :=
      XTI_Flags (POSIX.Option_Set'(Option => POSIX.C.XTI.T_PUSH));

   Orderly_Release_Data_Supported : constant CP_Flags
     := CP_Flags (POSIX.Empty_Set);
   Zero_Length_SDU_Supported :      constant CP_Flags :=
      CP_Flags (POSIX.Option_Set'(Option => POSIX.C.XTI.T_SENDZERO));

   Connect_Request_Received :     constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_LISTEN));
   Connect_Response_Received :    constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_CONNECT));
   Disconnect_Request_Received :  constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_DISCONNECT));
   Error_In_Previously_Sent_Datagram : constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_UDERR));
   Expedited_Data_Received :      constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_EXDATA));
   Normal_Data_Received :         constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_DATA));
   Okay_To_Send_Expedited_Data :  constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_GODATA));
   Okay_To_Send_Normal_Data :     constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_GOEXDATA));
   Orderly_Release_Request_Received : constant XTI_Events :=
      XTI_Events (POSIX.Option_Set'(Option => POSIX.C.XTI.T_ORDREL));

   procedure Raise_XTI_Error;

end POSIX.XTI;
