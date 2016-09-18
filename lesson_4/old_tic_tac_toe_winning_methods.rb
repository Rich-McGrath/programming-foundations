# I wanted to caputre my logic before it was refactored.
# winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
#                 [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # colums
#                 [[1, 5, 9], [3, 5, 7]]              # diagonal
#   winning_lines.each do |line|
#     if brd[line[0]] == PLAYER_MARKER &&
#       brd[line[1]] == PLAYER_MARKER &&
#       brd[line[2]] == PLAYER_MARKER
#     return 'Player'
#     elsif brd[line[0]] == COMPUTER_MARKER &&
#       brd[line[1]] == COMPUTER_MARKER &&
#       brd[line[2]] == COMPUTER_MARKER
#     return 'Computer'
#     end
#   end
# The code below is the refactored version of the above code
