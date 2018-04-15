with POSIX; use POSIX;
with POSIX.IO; use POSIX.IO;
with POSIX.Sockets; use POSIX.Sockets;
with POSIX.Sockets.Local; use POSIX.Sockets.Local;
with POSIX_Report; use POSIX_Report;
with Gnat.IO; use Gnat.IO;
with Ada.Streams; use Ada.Streams;
Procedure Test_Local_Ttime is
   LOOPS:            constant := 100000;
   BUFSIZE:          constant := 10;
   Talking_Socket:   File_Descriptor;
   Socket_Name:      aliased Local_Socket_Address;
   Socket_Path:      constant Pathname:="a_local_socket";
   Last:             POSIX.IO_Count;
   Buffer:           Stream_Element_Array(1..BUFSIZE):=(others=>0);
begin

   ------------------------------
   -- Time a local connection  --
   ------------------------------

   Talking_Socket := Create (Local_Protocol, Stream_Socket);
   Set_Socket_Path (Socket_Name, Socket_Path);
   Connect (Talking_Socket, +(Socket_Name'Unchecked_Access));
   Put ("Sending ");
   Put (LOOPS*BUFSIZE);
   Put_Line (" bytes...");
   for I in 1 .. LOOPS loop
      Send (Talking_Socket, Buffer (Buffer'First)'Address,
	    Buffer'Length, Last);
   end loop;
   Put_Line ("...Close the connection");
   close (Talking_Socket);
   Done;

   exception when E : others => Fatal_Exception (E, "A001");

end Test_Local_Ttime;
