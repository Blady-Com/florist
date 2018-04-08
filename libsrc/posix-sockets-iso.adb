package body POSIX.Sockets.ISO is

   pragma Warnings (Off);
   pragma Style_Checks (Off);
   --  Implementation needed...

   ---------
   -- "+" --
   ---------

   function "+"
     (Pointer : ISO_Socket_Address_Pointer)
      return POSIX.Sockets.Socket_Address_Pointer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """+"" unimplemented");
      raise Program_Error with "Unimplemented function ""+""";
      return "+" (Pointer => Pointer);
   end "+";

   ---------
   -- "+" --
   ---------

   function "+"
     (Pointer : POSIX.Sockets.Socket_Address_Pointer)
      return ISO_Socket_Address_Pointer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """+"" unimplemented");
      raise Program_Error with "Unimplemented function ""+""";
      return "+" (Pointer => Pointer);
   end "+";

   ---------------------------
   -- Is_ISO_Socket_Address --
   ---------------------------

   function Is_ISO_Socket_Address
     (Pointer : POSIX.Sockets.Socket_Address_Pointer)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_ISO_Socket_Address unimplemented");
      raise Program_Error with "Unimplemented function Is_ISO_Socket_Address";
      return Is_ISO_Socket_Address (Pointer => Pointer);
   end Is_ISO_Socket_Address;

   ---------------------
   -- Get_ISO_Address --
   ---------------------

   function Get_ISO_Address
     (Name : ISO_Socket_Address)
      return ISO_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_ISO_Address unimplemented");
      raise Program_Error with "Unimplemented function Get_ISO_Address";
      return Get_ISO_Address (Name => Name);
   end Get_ISO_Address;

   ---------------------
   -- Set_ISO_Address --
   ---------------------

   procedure Set_ISO_Address
     (Name          : in out ISO_Socket_Address;
      Address_Value :        ISO_Address)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_ISO_Address unimplemented");
      raise Program_Error with "Unimplemented procedure Set_ISO_Address";
   end Set_ISO_Address;

   -------------------------------
   -- Get_Presentation_Selector --
   -------------------------------

   function Get_Presentation_Selector
     (Name : ISO_Socket_Address)
      return Presentation_Selector
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Presentation_Selector unimplemented");
      raise Program_Error with "Unimplemented function Get_Presentation_Selector";
      return Get_Presentation_Selector (Name => Name);
   end Get_Presentation_Selector;

   -------------------------------
   -- Set_Presentation_Selector --
   -------------------------------

   procedure Set_Presentation_Selector
     (Name     : in out ISO_Socket_Address;
      Selector :        Presentation_Selector)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Presentation_Selector unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Presentation_Selector";
   end Set_Presentation_Selector;

   --------------------------
   -- Get_Session_Selector --
   --------------------------

   function Get_Session_Selector
     (Name : ISO_Socket_Address)
      return Session_Selector
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Session_Selector unimplemented");
      raise Program_Error with "Unimplemented function Get_Session_Selector";
      return Get_Session_Selector (Name => Name);
   end Get_Session_Selector;

   --------------------------
   -- Set_Session_Selector --
   --------------------------

   procedure Set_Session_Selector
     (Name     : in out ISO_Socket_Address;
      Selector :        Session_Selector)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Session_Selector unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Session_Selector";
   end Set_Session_Selector;

   ----------------------------
   -- Get_Transport_Selector --
   ----------------------------

   function Get_Transport_Selector
     (Name : ISO_Socket_Address)
      return Transport_Selector
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Transport_Selector unimplemented");
      raise Program_Error with "Unimplemented function Get_Transport_Selector";
      return Get_Transport_Selector (Name => Name);
   end Get_Transport_Selector;

   ----------------------------
   -- Set_Transport_Selector --
   ----------------------------

   procedure Set_Transport_Selector
     (Name     : in out ISO_Socket_Address;
      Selector :        Transport_Selector)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Transport_Selector unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Transport_Selector";
   end Set_Transport_Selector;

   ------------------------
   -- Get_GOSIP_Selector --
   ------------------------

   function Get_GOSIP_Selector
     (Name : ISO_Socket_Address)
      return GOSIP_Selector
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_GOSIP_Selector unimplemented");
      raise Program_Error with "Unimplemented function Get_GOSIP_Selector";
      return Get_GOSIP_Selector (Name => Name);
   end Get_GOSIP_Selector;

   ------------------------
   -- Set_GOSIP_Selector --
   ------------------------

   procedure Set_GOSIP_Selector
     (Name     : in out ISO_Socket_Address;
      Selector :        GOSIP_Selector)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_GOSIP_Selector unimplemented");
      raise Program_Error with "Unimplemented procedure Set_GOSIP_Selector";
   end Set_GOSIP_Selector;

   ---------------------
   -- Get_Socket_Name --
   ---------------------

   function Get_Socket_Name
     (Handle : Socket_Message)
      return ISO_Socket_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Socket_Name unimplemented");
      raise Program_Error with "Unimplemented function Get_Socket_Name";
      return Get_Socket_Name (Handle => Handle);
   end Get_Socket_Name;

   -----------------
   -- Get_Address --
   -----------------

   function Get_Address
     (Info_Item : Socket_Address_Info)
      return ISO_Socket_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Address unimplemented");
      raise Program_Error with "Unimplemented function Get_Address";
      return Get_Address (Info_Item => Info_Item);
   end Get_Address;

   -------------------
   -- Get_Peer_Name --
   -------------------

   function Get_Peer_Name
     (Socket : POSIX.IO.File_Descriptor)
      return ISO_Socket_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Peer_Name unimplemented");
      raise Program_Error with "Unimplemented function Get_Peer_Name";
      return Get_Peer_Name (Socket => Socket);
   end Get_Peer_Name;

   ---------------------
   -- Get_Socket_Name --
   ---------------------

   function Get_Socket_Name
     (Socket : POSIX.IO.File_Descriptor)
      return ISO_Socket_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Socket_Name unimplemented");
      raise Program_Error with "Unimplemented function Get_Socket_Name";
      return Get_Socket_Name (Socket => Socket);
   end Get_Socket_Name;

   --------------------
   -- Get_CL_Options --
   --------------------

   function Get_CL_Options
     (Socket : POSIX.IO.File_Descriptor)
      return CL_Options
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_CL_Options unimplemented");
      raise Program_Error with "Unimplemented function Get_CL_Options";
      return Get_CL_Options (Socket => Socket);
   end Get_CL_Options;

   --------------------
   -- Set_CL_Options --
   --------------------

   procedure Set_CL_Options
     (Socket : POSIX.IO.File_Descriptor;
      To     : CL_Options)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_CL_Options unimplemented");
      raise Program_Error with "Unimplemented procedure Set_CL_Options";
   end Set_CL_Options;

   ------------------
   -- Get_CL_Flags --
   ------------------

   function Get_CL_Flags
     (Socket : POSIX.IO.File_Descriptor)
      return CL_Flags
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_CL_Flags unimplemented");
      raise Program_Error with "Unimplemented function Get_CL_Flags";
      return Get_CL_Flags (Socket => Socket);
   end Get_CL_Flags;

   ------------------
   -- Set_CL_Flags --
   ------------------

   procedure Set_CL_Flags
     (Socket : POSIX.IO.File_Descriptor;
      To     : CL_Flags)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_CL_Flags unimplemented");
      raise Program_Error with "Unimplemented procedure Set_CL_Flags";
   end Set_CL_Flags;

   ------------------
   -- Get_TP_Flags --
   ------------------

   function Get_TP_Flags
     (Socket : POSIX.IO.File_Descriptor)
      return TP_Flags
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_TP_Flags unimplemented");
      raise Program_Error with "Unimplemented function Get_TP_Flags";
      return Get_TP_Flags (Socket => Socket);
   end Get_TP_Flags;

   -------------------------
   -- Get_Connection_Data --
   -------------------------

   function Get_Connection_Data
     (Socket : POSIX.IO.File_Descriptor)
      return POSIX.Octet_Array
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Connection_Data unimplemented");
      raise Program_Error with "Unimplemented function Get_Connection_Data";
      return Get_Connection_Data (Socket => Socket);
   end Get_Connection_Data;

   -------------------------
   -- Set_Connection_Data --
   -------------------------

   procedure Set_Connection_Data
     (Socket : POSIX.IO.File_Descriptor;
      To     : POSIX.Octet_Array)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Connection_Data unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Connection_Data";
   end Set_Connection_Data;

   -------------------------
   -- Get_Disconnect_Data --
   -------------------------

   function Get_Disconnect_Data
     (Socket : POSIX.IO.File_Descriptor)
      return POSIX.Octet_Array
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Disconnect_Data unimplemented");
      raise Program_Error with "Unimplemented function Get_Disconnect_Data";
      return Get_Disconnect_Data (Socket => Socket);
   end Get_Disconnect_Data;

   -------------------------
   -- Set_Disconnect_Data --
   -------------------------

   procedure Set_Disconnect_Data
     (Socket : POSIX.IO.File_Descriptor;
      To     : POSIX.Octet_Array)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Disconnect_Data unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Disconnect_Data";
   end Set_Disconnect_Data;

   ---------------------------
   -- Get_Confirmation_Data --
   ---------------------------

   function Get_Confirmation_Data
     (Socket : POSIX.IO.File_Descriptor)
      return POSIX.Octet_Array
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Confirmation_Data unimplemented");
      raise Program_Error with "Unimplemented function Get_Confirmation_Data";
      return Get_Confirmation_Data (Socket => Socket);
   end Get_Confirmation_Data;

   ---------------------------
   -- Set_Confirmation_Data --
   ---------------------------

   procedure Set_Confirmation_Data
     (Socket : POSIX.IO.File_Descriptor;
      To     : POSIX.Octet_Array)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Confirmation_Data unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Confirmation_Data";
   end Set_Confirmation_Data;

   ------------------------
   -- Set_Ancillary_Data --
   ------------------------

   procedure Set_Ancillary_Data
     (Message : in out Socket_Message;
      Object  :        TP_Ancillary_Data)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Ancillary_Data unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Ancillary_Data";
   end Set_Ancillary_Data;

   ------------------------
   -- Get_Ancillary_Data --
   ------------------------

   function Get_Ancillary_Data
     (Message : Socket_Message)
      return TP_Ancillary_Data
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Ancillary_Data unimplemented");
      raise Program_Error with "Unimplemented function Get_Ancillary_Data";
      return Get_Ancillary_Data (Message => Message);
   end Get_Ancillary_Data;

   ------------------------------
   -- Set_Ancillary_Data_Array --
   ------------------------------

   procedure Set_Ancillary_Data_Array
     (Object : in out TP_Ancillary_Data;
      Data   :        POSIX.Octet_Array)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Ancillary_Data_Array unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Ancillary_Data_Array";
   end Set_Ancillary_Data_Array;

   ------------------------------
   -- Get_Ancillary_Data_Array --
   ------------------------------

   function Get_Ancillary_Data_Array
     (Object : TP_Ancillary_Data)
      return POSIX.Octet_Array
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Ancillary_Data_Array unimplemented");
      raise Program_Error with "Unimplemented function Get_Ancillary_Data_Array";
      return Get_Ancillary_Data_Array (Object => Object);
   end Get_Ancillary_Data_Array;

   -------------------------------
   -- Get_Connection_Parameters --
   -------------------------------

   function Get_Connection_Parameters
     (Socket : POSIX.IO.File_Descriptor)
      return Connection_Parameters
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Connection_Parameters unimplemented");
      raise Program_Error with "Unimplemented function Get_Connection_Parameters";
      return Get_Connection_Parameters (Socket => Socket);
   end Get_Connection_Parameters;

   -------------------------------
   -- Set_Connection_Parameters --
   -------------------------------

   procedure Set_Connection_Parameters
     (Socket : POSIX.IO.File_Descriptor;
      To     : Connection_Parameters)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Connection_Parameters unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Connection_Parameters";
   end Set_Connection_Parameters;

   ---------------------------
   -- Get_Retransmit_Number --
   ---------------------------

   function Get_Retransmit_Number
     (Object : Connection_Parameters)
      return Natural
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Retransmit_Number unimplemented");
      raise Program_Error with "Unimplemented function Get_Retransmit_Number";
      return Get_Retransmit_Number (Object => Object);
   end Get_Retransmit_Number;

   ---------------------------
   -- Set_Retransmit_Number --
   ---------------------------

   procedure Set_Retransmit_Number
     (Object : in out Connection_Parameters;
      To     :        Natural)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Retransmit_Number unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Retransmit_Number";
   end Set_Retransmit_Number;

   ---------------------
   -- Get_Window_Size --
   ---------------------

   function Get_Window_Size
     (Object : Connection_Parameters)
      return Window_Size
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Window_Size unimplemented");
      raise Program_Error with "Unimplemented function Get_Window_Size";
      return Get_Window_Size (Object => Object);
   end Get_Window_Size;

   ---------------------
   -- Set_Window_Size --
   ---------------------

   procedure Set_Window_Size
     (Object : in out Connection_Parameters;
      To     :        Window_Size)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Window_Size unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Window_Size";
   end Set_Window_Size;

   -------------------
   -- Get_TPDU_Size --
   -------------------

   function Get_TPDU_Size
     (Object : Connection_Parameters)
      return TPDU_Size
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_TPDU_Size unimplemented");
      raise Program_Error with "Unimplemented function Get_TPDU_Size";
      return Get_TPDU_Size (Object => Object);
   end Get_TPDU_Size;

   -------------------
   -- Set_TPDU_Size --
   -------------------

   procedure Set_TPDU_Size
     (Object : in out Connection_Parameters;
      To     :        TPDU_Size)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_TPDU_Size unimplemented");
      raise Program_Error with "Unimplemented procedure Set_TPDU_Size";
   end Set_TPDU_Size;

   ---------------------------------
   -- Get_Acknowledgment_Strategy --
   ---------------------------------

   function Get_Acknowledgment_Strategy
     (Object : Connection_Parameters)
      return TP_Acknowledgment_Strategy
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Acknowledgment_Strategy unimplemented");
      raise Program_Error with "Unimplemented function Get_Acknowledgment_Strategy";
      return Get_Acknowledgment_Strategy (Object => Object);
   end Get_Acknowledgment_Strategy;

   ---------------------------------
   -- Set_Acknowledgment_Strategy --
   ---------------------------------

   procedure Set_Acknowledgment_Strategy
     (Object : in out Connection_Parameters;
      To     :        TP_Acknowledgment_Strategy)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Acknowledgment_Strategy unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Acknowledgment_Strategy";
   end Set_Acknowledgment_Strategy;

   -----------------------------
   -- Get_Retransmit_Strategy --
   -----------------------------

   function Get_Retransmit_Strategy
     (Object : Connection_Parameters)
      return TP_Retransmit_Strategy
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Retransmit_Strategy unimplemented");
      raise Program_Error with "Unimplemented function Get_Retransmit_Strategy";
      return Get_Retransmit_Strategy (Object => Object);
   end Get_Retransmit_Strategy;

   -----------------------------
   -- Set_Retransmit_Strategy --
   -----------------------------

   procedure Set_Retransmit_Strategy
     (Object : in out Connection_Parameters;
      To     :        TP_Retransmit_Strategy)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Retransmit_Strategy unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Retransmit_Strategy";
   end Set_Retransmit_Strategy;

   ------------------
   -- Get_TP_Class --
   ------------------

   function Get_TP_Class
     (Object : Connection_Parameters)
      return TP_Class
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_TP_Class unimplemented");
      raise Program_Error with "Unimplemented function Get_TP_Class";
      return Get_TP_Class (Object => Object);
   end Get_TP_Class;

   ------------------
   -- Set_TP_Class --
   ------------------

   procedure Set_TP_Class
     (Object : in out Connection_Parameters;
      To     :        TP_Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_TP_Class unimplemented");
      raise Program_Error with "Unimplemented procedure Set_TP_Class";
   end Set_TP_Class;

   -------------------------
   -- Get_Extended_Format --
   -------------------------

   function Get_Extended_Format
     (Object : Connection_Parameters)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Extended_Format unimplemented");
      raise Program_Error with "Unimplemented function Get_Extended_Format";
      return Get_Extended_Format (Object => Object);
   end Get_Extended_Format;

   -------------------------
   -- Set_Extended_Format --
   -------------------------

   procedure Set_Extended_Format
     (Object : in out Connection_Parameters;
      To     :        Boolean)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Extended_Format unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Extended_Format";
   end Set_Extended_Format;

   ---------------------------
   -- Get_Expedited_Service --
   ---------------------------

   function Get_Expedited_Service
     (Object : Connection_Parameters)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Expedited_Service unimplemented");
      raise Program_Error with "Unimplemented function Get_Expedited_Service";
      return Get_Expedited_Service (Object => Object);
   end Get_Expedited_Service;

   ---------------------------
   -- Set_Expedited_Service --
   ---------------------------

   procedure Set_Expedited_Service
     (Object : in out Connection_Parameters;
      To     :        Boolean)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Expedited_Service unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Expedited_Service";
   end Set_Expedited_Service;

   -----------------------------
   -- Get_Negotiate_Checksums --
   -----------------------------

   function Get_Negotiate_Checksums
     (Object : Connection_Parameters)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Negotiate_Checksums unimplemented");
      raise Program_Error with "Unimplemented function Get_Negotiate_Checksums";
      return Get_Negotiate_Checksums (Object => Object);
   end Get_Negotiate_Checksums;

   -----------------------------
   -- Set_Negotiate_Checksums --
   -----------------------------

   procedure Set_Negotiate_Checksums
     (Object : in out Connection_Parameters;
      To     :        Boolean)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Negotiate_Checksums unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Negotiate_Checksums";
   end Set_Negotiate_Checksums;

   -------------------------------
   -- Get_Signal_Disconnections --
   -------------------------------

   function Get_Signal_Disconnections
     (Object : Connection_Parameters)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Signal_Disconnections unimplemented");
      raise Program_Error with "Unimplemented function Get_Signal_Disconnections";
      return Get_Signal_Disconnections (Object => Object);
   end Get_Signal_Disconnections;

   -------------------------------
   -- Set_Signal_Disconnections --
   -------------------------------

   procedure Set_Signal_Disconnections
     (Object : in out Connection_Parameters;
      To     :        Boolean)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Signal_Disconnections unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Signal_Disconnections";
   end Set_Signal_Disconnections;

   ----------------------------
   -- Get_Protect_Parameters --
   ----------------------------

   function Get_Protect_Parameters
     (Object : Connection_Parameters)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Protect_Parameters unimplemented");
      raise Program_Error with "Unimplemented function Get_Protect_Parameters";
      return Get_Protect_Parameters (Object => Object);
   end Get_Protect_Parameters;

   ----------------------------
   -- Set_Protect_Parameters --
   ----------------------------

   procedure Set_Protect_Parameters
     (Object : in out Connection_Parameters;
      To     :        Boolean)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Protect_Parameters unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Protect_Parameters";
   end Set_Protect_Parameters;

   -------------------------
   -- Get_Network_Service --
   -------------------------

   function Get_Network_Service
     (Object : Connection_Parameters)
      return TP_Network_Service
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Network_Service unimplemented");
      raise Program_Error with "Unimplemented function Get_Network_Service";
      return Get_Network_Service (Object => Object);
   end Get_Network_Service;

   -------------------------
   -- Set_Network_Service --
   -------------------------

   procedure Set_Network_Service
     (Object : in out Connection_Parameters;
      To     :        TP_Network_Service)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Network_Service unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Network_Service";
   end Set_Network_Service;

   -------------
   -- Address --
   -------------

   function Address
     (Name : ISO_Socket_Address)
      return POSIX.C.Sockets.sockaddr_var_ptr
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Address unimplemented");
      raise Program_Error with "Unimplemented function Address";
      return Address (Name => Name);
   end Address;

   ------------
   -- Length --
   ------------

   function Length
     (Name : ISO_Socket_Address)
      return POSIX.C.size_t
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Length unimplemented");
      raise Program_Error with "Unimplemented function Length";
      return Length (Name => Name);
   end Length;

end POSIX.Sockets.ISO;
