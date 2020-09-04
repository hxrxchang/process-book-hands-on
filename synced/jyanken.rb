require "socket"

listening_socket = TCPServer.open(12345)

loop do
  puts "jyanken server start"
  socket = listening_socket.accept
  puts "user requested"
  socket.puts("your hand?:  g or c or p\n")

  socket.close
end
