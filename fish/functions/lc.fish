function lc
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes $argv[1]
end