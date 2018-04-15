with POSIX; use POSIX;
with POSIX.IO; use POSIX.IO;
with POSIX.Sockets; use POSIX.Sockets;
with POSIX.Sockets.Local; use POSIX.Sockets.Local;
with POSIX_Report; use POSIX_Report;
with Ada.Unchecked_Conversion;
procedure Test_Ancillary_Talk is
   Talking_Socket : File_Descriptor;
   Socket_Name    : aliased Local_Socket_Address;
   Socket_Path    : constant Pathname := "a_local_socket";
   Last           : POSIX.IO_Count;
   SGV_Array      : constant IO_Vector_Array_Pointer
     := new IO_Vector_Array (1 .. 1);       -- note this is born null
   type FD_Array is array (Positive range <>) of File_Descriptor;
   type FD_Array_Access is access all FD_Array;
   Files          : constant Fd_Array_Access := new FD_Array (1 .. 3);
   Message        : Socket_Message;

begin

   --------------------------------------------
   -- Send ancillary data on a local socket  --
   --------------------------------------------

   Test ("Send ancillary data on local socket");

   Talking_Socket := Create (Local_Protocol, Stream_Socket);
   Set_Socket_Path (Socket_Name, Socket_Path);
   Connect (Talking_Socket, +(Socket_Name'Unchecked_Access));

   Comment ("Send message with ancillary data only...");
   Files.all (1) := Talking_Socket;
   Files.all (2) := 222;
   Files.all (3) := 333;
   Set_Ancillary_Data (Message, Files.all'Address, Files.all'Size);
   Set_IO_Vector_Array (Message, SGV_Array);
   Send_Message (Talking_Socket, Message, Last);

   Close (Talking_Socket);

   Done;

   exception when E : others => Fatal_Exception (E, "A001");

end Test_Ancillary_Talk;
