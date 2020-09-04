require "socket"

listening_socket = TCPServer.open(12345)
hands = {
  "g" => {"g" => "again", "c" => "won", "p" => "lose"},
  "c" => {"g" => "lose", "c" => "again", "p" => "won"},
  "p" => {"g" => "won", "c" => "lose", "p" => "again"}
}

loop do
  puts "jyanken server start"
  socket = listening_socket.accept
  puts "user requested"
  socket.puts("your hand?:  g or c or p\n")

  loop do
    client_hand = socket.gets.gsub!(/[\r\n]/, "")

    if !hands.keys.include?(client_hand)
      socket.puts("hmmmm?")
    else
      server_hand = hands.keys.sample
      socket.puts("com's hand: #{server_hand}")
      result = hands[client_hand][server_hand]

      if result == 'won' || result == 'lose'
        socket.puts("You #{result}")
        socket.close
        break
      else
        socket.puts(result)
        puts "restart"
        socket.puts("your hand?:  g or c or p\n")
      end
    end
  end
end
