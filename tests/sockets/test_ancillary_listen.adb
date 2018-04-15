with POSIX; use POSIX;
with POSIX.IO; use POSIX.IO;
with POSIX.Files; use POSIX.Files;
with POSIX.Sockets; use POSIX.Sockets;
with POSIX.Sockets.Local; use POSIX.Sockets.Local;
with POSIX_Report; use POSIX_Report;
with GNAT.IO; use GNAT.IO;
procedure Test_Ancillary_Listen is
   Listening_Socket : File_Descriptor;
   Accepting_Socket : File_Descriptor;
   Socket_Name      : aliased Local_Socket_Address;
   Socket_Path      : constant Pathname := "a_local_socket";
   Last             : POSIX.IO_Count;
   SGV_Array        : constant IO_Vector_Array_Pointer
      := new IO_Vector_Array (1 .. 1);       -- note this is born null
   type FD_Array is array (Positive range <>) of File_Descriptor;
   Files            : Fd_Array (1 .. 3);
   Message          : Socket_Message;
begin

   -----------------------------------------------
   -- Receive ancillary data on a local socket  --
   -----------------------------------------------

   Test ("Receive ancillary data on local socket");

   Listening_Socket := Create (Local_Protocol, Stream_Socket);
   Set_Socket_Path (Socket_Name, Socket_Path);
   Bind (Listening_Socket, +(Socket_Name'Unchecked_Access));
   Listen (Listening_Socket, 1);
   Accepting_Socket := Accept_Connection (Listening_Socket);

   Comment ("Receive message with ancillary data only...");
   Set_Ancillary_Data (Message, Files'Address, Files'Size);
   Set_IO_Vector_Array (Message, SGV_Array);
   Receive_Message (Accepting_Socket, Message, Last);
   -- Files := Get_Ancillary_Data (Message);
   if Verbose then
      Put ("...Ancillary data received:");
      Put (Integer(Files(1))); Put (", ");
      Put (Integer(Files(2))); Put (", ");
      Put (Integer(Files(3))); New_Line;
   end if;
   Unlink (Socket_Path);

   Done;

   exception when E : others => Fatal_Exception (E, "A001");

end Test_Ancillary_Listen;
