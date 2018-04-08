package body POSIX.XTI.mOSI is

   pragma Warnings (Off);
   pragma Style_Checks (Off);
   --  Implementation needed...

   ---------
   -- "+" --
   ---------

   function "+"
     (Pointer : mOSI_XTI_Address_Pointer)
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
      return mOSI_XTI_Address_Pointer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """+"" unimplemented");
      raise Program_Error with "Unimplemented function ""+""";
      return "+" (Pointer => Pointer);
   end "+";

   -------------------------
   -- Is_mOSI_XTI_Address --
   -------------------------

   function Is_mOSI_XTI_Address
     (Pointer : POSIX.XTI.XTI_Address_Pointer)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Is_mOSI_XTI_Address unimplemented");
      raise Program_Error with "Unimplemented function Is_mOSI_XTI_Address";
      return Is_mOSI_XTI_Address (Pointer => Pointer);
   end Is_mOSI_XTI_Address;

   ---------------
   -- Get_Flags --
   ---------------

   function Get_Flags
     (Address : mOSI_XTI_Address)
      return mOSI_Address_Flags
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Flags unimplemented");
      raise Program_Error with "Unimplemented function Get_Flags";
      return Get_Flags (Address => Address);
   end Get_Flags;

   ---------------
   -- Set_Flags --
   ---------------

   procedure Set_Flags
     (Address : in out mOSI_XTI_Address;
      To      :        mOSI_Address_Flags)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Flags unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Flags";
   end Set_Flags;

   --------------------------
   -- Get_AP_Invocation_Id --
   --------------------------

   function Get_AP_Invocation_Id
     (Address : mOSI_XTI_Address)
      return AP_Invocation_Id
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_AP_Invocation_Id unimplemented");
      raise Program_Error with "Unimplemented function Get_AP_Invocation_Id";
      return Get_AP_Invocation_Id (Address => Address);
   end Get_AP_Invocation_Id;

   --------------------------
   -- Set_AP_Invocation_Id --
   --------------------------

   procedure Set_AP_Invocation_Id
     (Address : in out mOSI_XTI_Address;
      To      :        AP_Invocation_Id)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_AP_Invocation_Id unimplemented");
      raise Program_Error with "Unimplemented procedure Set_AP_Invocation_Id";
   end Set_AP_Invocation_Id;

   --------------------------
   -- Get_AE_Invocation_Id --
   --------------------------

   function Get_AE_Invocation_Id
     (Address : mOSI_XTI_Address)
      return AE_Invocation_Id
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_AE_Invocation_Id unimplemented");
      raise Program_Error with "Unimplemented function Get_AE_Invocation_Id";
      return Get_AE_Invocation_Id (Address => Address);
   end Get_AE_Invocation_Id;

   --------------------------
   -- Set_AE_Invocation_Id --
   --------------------------

   procedure Set_AE_Invocation_Id
     (Address : in out mOSI_XTI_Address;
      To      :        AE_Invocation_Id)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_AE_Invocation_Id unimplemented");
      raise Program_Error with "Unimplemented procedure Set_AE_Invocation_Id";
   end Set_AE_Invocation_Id;

   ------------------
   -- Get_AP_Title --
   ------------------

   function Get_AP_Title
     (Address : mOSI_XTI_Address)
      return AP_Title
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_AP_Title unimplemented");
      raise Program_Error with "Unimplemented function Get_AP_Title";
      return Get_AP_Title (Address => Address);
   end Get_AP_Title;

   ----------------------
   -- Get_AE_Qualifier --
   ----------------------

   function Get_AE_Qualifier
     (Address : mOSI_XTI_Address)
      return AE_Qualifier
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_AE_Qualifier unimplemented");
      raise Program_Error with "Unimplemented function Get_AE_Qualifier";
      return Get_AE_Qualifier (Address => Address);
   end Get_AE_Qualifier;

   ------------------------------
   -- Get_Presentation_Address --
   ------------------------------

   function Get_Presentation_Address
     (Address : mOSI_XTI_Address)
      return Presentation_Address
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Presentation_Address unimplemented");
      raise Program_Error with "Unimplemented function Get_Presentation_Address";
      return Get_Presentation_Address (Address => Address);
   end Get_Presentation_Address;

   ---------------------
   -- Set_OSI_Address --
   ---------------------

   procedure Set_OSI_Address
     (Address : in out mOSI_XTI_Address;
      AP      :        AP_Title;
      AE      :        AE_Qualifier;
      PA      :        Presentation_Address)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_OSI_Address unimplemented");
      raise Program_Error with "Unimplemented procedure Set_OSI_Address";
   end Set_OSI_Address;

   -----------------
   -- Get_Address --
   -----------------

   procedure Get_Address
     (Info_Item :        Connection_Info;
      Address   : in out mOSI_XTI_Address)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Address unimplemented");
      raise Program_Error with "Unimplemented procedure Get_Address";
   end Get_Address;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value
     (Option_Item : Protocol_Option)
      return Application_Context_Name
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
      Value       :        Application_Context_Name)
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
      return Presentation_Context_List
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
      Value       :        Presentation_Context_List)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Option unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Option";
   end Set_Option;

   -------------------------
   -- Set_Presentation_Id --
   -------------------------

   procedure Set_Presentation_Id
     (List : in out Presentation_Context_Item;
      Item :        Presentation_Item_Id)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Presentation_Id unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Presentation_Id";
   end Set_Presentation_Id;

   -------------------------
   -- Get_Presentation_Id --
   -------------------------

   function Get_Presentation_Id
     (Item : Presentation_Context_Item)
      return Presentation_Item_Id
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Presentation_Id unimplemented");
      raise Program_Error with "Unimplemented function Get_Presentation_Id";
      return Get_Presentation_Id (Item => Item);
   end Get_Presentation_Id;

   ----------------------------
   -- Set_Negotiation_Result --
   ----------------------------

   procedure Set_Negotiation_Result
     (List : in out Presentation_Context_Item;
      Item :        Negotiation_Result)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Negotiation_Result unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Negotiation_Result";
   end Set_Negotiation_Result;

   ----------------------------
   -- Get_Negotiation_Result --
   ----------------------------

   function Get_Negotiation_Result
     (Item : Presentation_Context_Item)
      return Negotiation_Result
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Negotiation_Result unimplemented");
      raise Program_Error with "Unimplemented function Get_Negotiation_Result";
      return Get_Negotiation_Result (Item => Item);
   end Get_Negotiation_Result;

   -----------------------
   -- Set_Syntax_Object --
   -----------------------

   procedure Set_Syntax_Object
     (List : in out Presentation_Context_Item;
      Item :        Syntax_Object_List)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Set_Syntax_Object unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Syntax_Object";
   end Set_Syntax_Object;

   -----------------------
   -- Get_Syntax_Object --
   -----------------------

   function Get_Syntax_Object
     (Item : Presentation_Context_Item)
      return Syntax_Object_List
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Get_Syntax_Object unimplemented");
      raise Program_Error with "Unimplemented function Get_Syntax_Object";
      return Get_Syntax_Object (Item => Item);
   end Get_Syntax_Object;

   ----------------
   -- Make_Empty --
   ----------------

   procedure Make_Empty (List : in out Presentation_Context_List) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Make_Empty unimplemented");
      raise Program_Error with "Unimplemented procedure Make_Empty";
   end Make_Empty;

   ---------
   -- Add --
   ---------

   procedure Add
     (List : in out Presentation_Context_List;
      Item :        Presentation_Context_Item)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Add unimplemented");
      raise Program_Error with "Unimplemented procedure Add";
   end Add;

   -----------------------------------------
   -- For_Every_Presentation_Context_Item --
   -----------------------------------------

   procedure For_Every_Presentation_Context_Item (List : Presentation_Context_List)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "For_Every_Presentation_Context_Item unimplemented");
      raise Program_Error with "Unimplemented procedure For_Every_Presentation_Context_Item";
   end For_Every_Presentation_Context_Item;

   ------------
   -- Length --
   ------------

   function Length (List : Presentation_Context_List) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Length unimplemented");
      raise Program_Error with "Unimplemented function Length";
      return Length (List => List);
   end Length;

   -------------
   -- Element --
   -------------

   function Element
     (List : Presentation_Context_List;
      Index : Positive)
      return Presentation_Context_Item
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Element unimplemented");
      raise Program_Error with "Unimplemented function Element";
      return Element (List => List, Index => Index);
   end Element;

   ----------------
   -- Make_Empty --
   ----------------

   procedure Make_Empty (List : in out Syntax_Object_List) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Make_Empty unimplemented");
      raise Program_Error with "Unimplemented procedure Make_Empty";
   end Make_Empty;

   ---------
   -- Add --
   ---------

   procedure Add
     (List : in out Syntax_Object_List;
      Item :        Object_Identifier)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Add unimplemented");
      raise Program_Error with "Unimplemented procedure Add";
   end Add;

   ---------------------------------
   -- For_Every_Object_Identifier --
   ---------------------------------

   procedure For_Every_Object_Identifier (List : Syntax_Object_List) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "For_Every_Object_Identifier unimplemented");
      raise Program_Error with "Unimplemented procedure For_Every_Object_Identifier";
   end For_Every_Object_Identifier;

   ------------
   -- Length --
   ------------

   function Length (List : Syntax_Object_List) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Length unimplemented");
      raise Program_Error with "Unimplemented function Length";
      return Length (List => List);
   end Length;

   -------------
   -- Element --
   -------------

   function Element
     (List  : Syntax_Object_List;
      Index : Positive)
      return Object_Identifier
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Element unimplemented");
      raise Program_Error with "Unimplemented function Element";
      return Element (List => List, Index => Index);
   end Element;

end POSIX.XTI.mOSI;
