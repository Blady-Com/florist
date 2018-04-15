with POSIX; use POSIX;
with POSIX.Sockets; use POSIX.Sockets;
with POSIX.Sockets.Internet; use POSIX.Sockets.Internet;
with POSIX_Report; use POSIX_Report;
with Gnat.IO; use Gnat.IO;
with Text_IO;
with Ada.Text_IO;

Procedure Test_Database is

   Procedure Display_Network_Info (Net_Info: Network_Info) is
      Temp: String (1 .. 5);
      package Net_IO is new Text_IO.Integer_IO (Network_Number);
   begin
      declare
         Name: constant POSIX_String := Get_Name (Net_Info);
         Sname: constant String := To_String(Name);
      begin
         Comment ("...Network Name: " & Sname);
      end;
--      case Get_Address_Family (Net_Info) is
--         when Internet_Domain =>
--            Comment ("...Address Family: Internet_Domain");
--         when Others =>
--            Comment ("...Address Family: Unknown_Domain");
--      end case;
      Net_IO.Put (Temp, Get_Network_Number (Net_Info));
      Comment ("...Network Number: " & Temp);
      declare
         procedure Print_Alias
           (Name: in     POSIX_String;
            Quit: in out Boolean) is
         begin
            if Verbose then
               Put (To_String(Name) & " ");
            end if;
         end Print_Alias;
         procedure Print_Every_Alias is new
                      For_Every_Network_Alias(Print_Alias);
      begin
         if Verbose then
            Put ("  ...Network Aliases: ");
         end if;
         Print_Every_Alias (Net_Info);
         if Verbose then
            New_Line;
         end if;
      end;
   end Display_Network_Info;

   Procedure Display_Protocol_Info (Pro_Info: Protocol_Info) is
      Temp: String (1 .. 5);
      package Pro_IO is new Ada.Text_IO.Integer_IO (Protocol_Number);
   begin
      declare
         Name: constant POSIX_String := Get_Name (Pro_Info);
         Sname: constant String := To_String(Name);
      begin
         Comment ("...Protocol Name: " & Sname);
      end;
      Pro_IO.Put (Temp, Get_Protocol_Number (Pro_Info));
      Comment ("...Protocol Number: " & Temp);
      declare
         procedure Print_Alias
           (Name: in     POSIX_String;
            Quit: in out Boolean) is
         begin
            if Verbose then
               Put (To_String(Name) & " ");
            end if;
         end Print_Alias;
         procedure Print_Every_Alias is new For_Every_Protocol_Alias(Print_Alias);
      begin
         if Verbose then
            Put ("  ...Protocol Aliases: ");
         end if;
         Print_Every_Alias (Pro_Info);
         if Verbose then
            New_Line;
         end if;
      end;
   end Display_Protocol_Info;

   Net_Info: Network_Info;
   Pro_Info: Protocol_Info;

   Storage : constant POSIX.Sockets.Internet.Database_Array_Pointer :=
                       new POSIX.Sockets.Internet.Database_Array (1 .. 1024);
begin

   -----------------------
   -- Network Database  --
   -----------------------

   Test ("Network Database");

   Comment ("Open Network Database");
   Open_Network_Database_Connection (True);

   Comment ("Get Network Information by Name");
   Net_Info := Get_Network_Info_By_Name ("loopback", Storage);
   Display_Network_Info (Net_Info);

   Comment ("Get Network Information by Address");
   Net_Info := Get_Network_Info_By_Address
                          (127, Internet_Protocol, Storage);
   Display_Network_Info (Net_Info);

   Comment ("Try a non-existent network");
   Net_Info := Get_Network_Info_By_Name ("garbage", Storage);
   Display_Network_Info (Net_Info);

   Comment ("Close Network Database");
   Close_Network_Database_Connection;

   ------------------------
   -- Protocol Database  --
   ------------------------
   Test ("Protocol Database");

   Comment ("Open Protocol Database");
   Open_Protocol_Database_Connection (True);

   Comment ("Get Protocol Information by Name");
   Pro_Info := Get_Protocol_Info_By_Name ("tcp", Storage);
   Display_Protocol_Info (Pro_Info);
   Pro_Info := Get_Protocol_Info_By_Name ("udp", Storage);
   Display_Protocol_Info (Pro_Info);

   Comment ("Get Protocol Information by Number");
   Pro_Info := Get_Protocol_Info_By_Number (1, Storage);
   Display_Protocol_Info (Pro_Info);

   Comment ("Try a non-existent protocol");
   Pro_Info := Get_Protocol_Info_By_Name ("garbage", Storage);
   Display_Protocol_Info (Pro_Info);

   Comment ("Close Protocol Database");
   Close_Protocol_Database_Connection;

   Done;

   exception when E : others => Fatal_Exception (E, "A001");

end Test_Database;
