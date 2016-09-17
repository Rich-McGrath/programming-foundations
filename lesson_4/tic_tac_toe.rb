require 'pry'

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = '0'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # colums
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/ABcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}'s and the computer is #{COMPUTER_MARKER}'s"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+----"
  puts "     |     |"
  puts "   #{brd[4]} |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+----"
  puts "     |     |"
  puts "   #{brd[7]} |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/ABcSize

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt("Choose a position to place a piece: #{joinor(empty_squares(brd), ', ')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
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
  # The code below is the refactored version of the above code.
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = intialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt 'Do you want to play again? (y or n)'
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
  # break if answer == 'n' || answer == 'no'
end

prompt 'Thank you for play Tic Tac Toe. Goodbye!'
