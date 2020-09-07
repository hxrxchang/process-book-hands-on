require "socket"

listening_socket = TCPServer.open(12345)
hands = {
  "g" => {"g" => "draw", "c" => "win", "p" => "lose"},
  "c" => {"g" => "lose", "c" => "draw", "p" => "win"},
  "p" => {"g" => "win", "c" => "lose", "p" => "draw"}
}

responses = {
  "win" => "you won",
  "lose" => "you lost",
  "draw" => "again"
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

      socket.puts(responses[result])

      if result == 'win' || result == 'lose'
        socket.close
        break
      else
        puts "restart"
        socket.puts("your hand?:  g or c or p\n")
      end
    end
  end
end
