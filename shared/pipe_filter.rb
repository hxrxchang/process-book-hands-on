begin
  loop do
    line = $stdin.readline
    i = line.chomp.to_i
    doubled = i * 2
    puts "#{doubled}\n"
    sleep 1
  end
rescue EOFError
  # nop
end
