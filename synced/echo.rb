file = $stdin
lines = file.readlines #標準入力からの入力を全部受け取る
file.close

file = $stdout
file.write(lines.join) # 標準出力に対して内容を書き出す
file.close