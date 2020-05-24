input_file = $stdin
output_file = $stdout

begin
  while true do
    line = input_file.readline

    output_file.write(line)
  end
rescue EOFError
  input_file.close
  output_file.close
end



