# not a fully working just and example from tic_tac_toe.rb explaining the
# computer_places_piece! and find_at_risk_square method.

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # colums
                [[1, 5, 9], [3, 5, 7]]              # diagonals

new_board => {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    # first time through line will equal 1, 2, 3, second time 4, 5, 6.
    square = find_at_risk_square(line, brd) # passing [1, 2, 3] and the board hash to find_at_risk_square method
    break if square
  end

  if !square # if square is false sample from empty_squares
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count(PLAYER_MARKER) == 2
  # we are going to see if board[1] board[2] and board[2] will contain 2 'X'
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first

    # for the board hash I want to select each Key and value and pipe it to k, v
    # from line look for the key with a value of ' '.
    # keys will then return a new array then first will return the first element of the array.
    # In this case being the square number.

  end
end
