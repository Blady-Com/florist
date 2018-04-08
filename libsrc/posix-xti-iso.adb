package body POSIX.XTI.ISO is

   pragma Warnings (Off);
   pragma Style_Checks (Off);
   --  Implementation needed...

   ---------
   -- "+" --
   ---------

   function "+"
     (Pointer : ISO_XTI_Address_Pointer)
      return POSIX.XTI.XTI_Address_Pointer
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
     (Pointer : POSIX.XTI.XTI_Address_Pointer)
      return ISO_XTI_Address_Pointer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """+"" unimplemented");
      raise Program_Error with "Unimplemented function ""+""";
      return "+" (Pointer => Pointer);
   end "+";

   ------------------------
   -- Is_ISO_XTI_Address --
   ------------------------

   function Is_ISO_XTI_Address
     (Pointer : POSIX.XTI.XTI_Address_Pointer)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_ISO_XTI_Address unimplemented");
      raise Program_Error with "Unimplemented function Is_ISO_XTI_Address";
      return Is_ISO_XTI_Address (Pointer => Pointer);
   end Is_ISO_XTI_Address;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return ISO_Option
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        ISO_Option)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------------
   -- Get_Target_Rate --
   ---------------------

   function Get_Target_Rate
     (Item : Rate)
      return Duration
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Target_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Target_Rate";
      return Get_Target_Rate (Item => Item);
   end Get_Target_Rate;

   ---------------------
   -- Set_Target_Rate --
   ---------------------

   procedure Set_Target_Rate
     (Item : in out Rate;
      To   :        Duration)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Target_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Target_Rate";
   end Set_Target_Rate;

   ---------------------------------
   -- Get_Minimum_Acceptable_Rate --
   ---------------------------------

   function Get_Minimum_Acceptable_Rate
     (Item : Rate)
      return Duration
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Minimum_Acceptable_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Minimum_Acceptable_Rate";
      return Get_Minimum_Acceptable_Rate (Item => Item);
   end Get_Minimum_Acceptable_Rate;

   ---------------------------------
   -- Set_Minimum_Acceptable_Rate --
   ---------------------------------

   procedure Set_Minimum_Acceptable_Rate
     (Item : in out Rate;
      To   :        Duration)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Minimum_Acceptable_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Minimum_Acceptable_Rate";
   end Set_Minimum_Acceptable_Rate;

   ---------------------
   -- Get_Target_Rate --
   ---------------------

   function Get_Target_Rate
     (Item : Rate)
      return Error_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Target_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Target_Rate";
      return Get_Target_Rate (Item => Item);
   end Get_Target_Rate;

   ---------------------
   -- Set_Target_Rate --
   ---------------------

   procedure Set_Target_Rate
     (Item : in out Rate;
      To   :        Error_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Target_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Target_Rate";
   end Set_Target_Rate;

   ---------------------------------
   -- Get_Minimum_Acceptable_Rate --
   ---------------------------------

   function Get_Minimum_Acceptable_Rate
     (Item : Rate)
      return Error_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Minimum_Acceptable_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Minimum_Acceptable_Rate";
      return Get_Minimum_Acceptable_Rate (Item => Item);
   end Get_Minimum_Acceptable_Rate;

   ---------------------------------
   -- Set_Minimum_Acceptable_Rate --
   ---------------------------------

   procedure Set_Minimum_Acceptable_Rate
     (Item : in out Rate;
      To   :        Error_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Minimum_Acceptable_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Minimum_Acceptable_Rate";
   end Set_Minimum_Acceptable_Rate;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Priority_Level
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Priority_Level)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Protection_Level
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Protection_Level)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   -----------------
   -- Get_Address --
   -----------------

   procedure Get_Address
     (Info_Item :        Connection_Info;
      Address   : in out ISO_XTI_Address)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Address unimplemented");
      raise Program_Error with "Unimplemented procedure Get_Address";
   end Get_Address;

   ---------------------
   -- Get_Called_Rate --
   ---------------------

   function Get_Called_Rate
     (Item : Requested_Rate)
      return Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Called_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Called_Rate";
      return Get_Called_Rate (Item => Item);
   end Get_Called_Rate;

   ---------------------
   -- Set_Called_Rate --
   ---------------------

   procedure Set_Called_Rate
     (Item : in out Requested_Rate;
      To   :        Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Called_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Called_Rate";
   end Set_Called_Rate;

   ----------------------
   -- Get_Calling_Rate --
   ----------------------

   function Get_Calling_Rate
     (Item : Requested_Rate)
      return Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Calling_Rate unimplemented");
      raise Program_Error with "Unimplemented function Get_Calling_Rate";
      return Get_Calling_Rate (Item => Item);
   end Get_Calling_Rate;

   ----------------------
   -- Set_Calling_Rate --
   ----------------------

   procedure Set_Calling_Rate
     (Item : in out Requested_Rate;
      To   :        Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Calling_Rate unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Calling_Rate";
   end Set_Calling_Rate;

   ----------------------------
   -- Get_Throughput_Maximum --
   ----------------------------

   function Get_Throughput_Maximum
     (Item : Throughput_Rate)
      return Requested_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Throughput_Maximum unimplemented");
      raise Program_Error with "Unimplemented function Get_Throughput_Maximum";
      return Get_Throughput_Maximum (Item => Item);
   end Get_Throughput_Maximum;

   ----------------------------
   -- Set_Throughput_Maximum --
   ----------------------------

   procedure Set_Throughput_Maximum
     (Item : in out Throughput_Rate;
      To   :        Requested_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Throughput_Maximum unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Throughput_Maximum";
   end Set_Throughput_Maximum;

   ----------------------------
   -- Get_Throughput_Average --
   ----------------------------

   function Get_Throughput_Average
     (Item : Throughput_Rate)
      return Requested_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Throughput_Average unimplemented");
      raise Program_Error with "Unimplemented function Get_Throughput_Average";
      return Get_Throughput_Average (Item => Item);
   end Get_Throughput_Average;

   ----------------------------
   -- Set_Throughput_Average --
   ----------------------------

   procedure Set_Throughput_Average
     (Item : in out Throughput_Rate;
      To   :        Requested_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Throughput_Average unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Throughput_Average";
   end Set_Throughput_Average;

   -------------------------------
   -- Get_Transit_Delay_Maximum --
   -------------------------------

   function Get_Transit_Delay_Maximum
     (Item : Transit_Delay_Rate)
      return Requested_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Transit_Delay_Maximum unimplemented");
      raise Program_Error with "Unimplemented function Get_Transit_Delay_Maximum";
      return Get_Transit_Delay_Maximum (Item => Item);
   end Get_Transit_Delay_Maximum;

   -------------------------------
   -- Set_Transit_Delay_Maximum --
   -------------------------------

   procedure Set_Transit_Delay_Maximum
     (Item : in out Transit_Delay_Rate;
      To   :        Requested_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Transit_Delay_Maximum unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Transit_Delay_Maximum";
   end Set_Transit_Delay_Maximum;

   -------------------------------
   -- Get_Transit_Delay_Average --
   -------------------------------

   function Get_Transit_Delay_Average
     (Item : Transit_Delay_Rate)
      return Requested_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Transit_Delay_Average unimplemented");
      raise Program_Error with "Unimplemented function Get_Transit_Delay_Average";
      return Get_Transit_Delay_Average (Item => Item);
   end Get_Transit_Delay_Average;

   -------------------------------
   -- Set_Transit_Delay_Average --
   -------------------------------

   procedure Set_Transit_Delay_Average
     (Item : in out Transit_Delay_Rate;
      To   :        Requested_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Transit_Delay_Average unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Transit_Delay_Average";
   end Set_Transit_Delay_Average;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Throughput_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Throughput_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Transit_Delay_Rate
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Transit_Delay_Rate)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return ISO_COTS_Option
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        ISO_COTS_Option)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Transport_Class
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Transport_Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Duration
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Value unimplemented");
      raise Program_Error with "Unimplemented function Get_Value";
      return Get_Value (Option_Item => Option_Item);
   end Get_Value;

   ----------------
   -- Set_Option --
   ----------------

   procedure Set_Option
     (Option_Item : in out Protocol_Option;
      Level       :        Option_Level;
      Name        :        Option_Name;
      To          :        Duration)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

end POSIX.XTI.ISO;
