stdout-to-file:
	ruby stdout-and-stderr.rb 1> out/out.txt
stderr-to-file:
	ruby stdout-and-stderr.rb 2> out/err.txt
stdout-and-stderr-to-file:
	# &0は標準入力, &1は標準出力, $2は標準エラー出力
	ruby stdout-and-stderr.rb 1> out/out-and-err.txt 2>&1
