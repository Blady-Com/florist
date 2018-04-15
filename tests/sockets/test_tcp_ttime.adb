with POSIX; use POSIX;
with POSIX.IO; use POSIX.IO;
with POSIX.Sockets; use POSIX.Sockets;
with POSIX.Sockets.Internet; use POSIX.Sockets.Internet;
with POSIX_Report; use POSIX_Report;
with Gnat.IO; use Gnat.IO;
with Ada.Streams; use Ada.Streams;

Procedure Test_TCP_Ttime is
   LOOPS:            constant := 100000;
   BUFSIZE:          constant := 10;
   Talking_Socket:   File_Descriptor;
   Socket_Name:      aliased Internet_Socket_Address;
   Last:             POSIX.IO_Count;
   Buffer:           Stream_Element_Array(1..BUFSIZE):=(others=>0);
begin

   ------------------------------
   -- Talk on a TCP/IP socket  --
   ------------------------------

   Talking_Socket := Create (Internet_Protocol, Stream_Socket);
   Set_Internet_Address (
      Name => Socket_Name,
      Address => String_To_Internet_Address ("129.218.154.50"));
   Set_Internet_Port (Socket_Name, 1234);
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

end Test_TCP_Ttime;
