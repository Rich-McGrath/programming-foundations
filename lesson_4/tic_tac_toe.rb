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

# rubocop:disable Metrics/AbcSize
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
# rubocop:enable Metrics/AbcSize

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
    prompt("Choose a position to place a piece:" \
            "#{joinor(empty_squares(brd), ', ')}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd, square = nil)
  # computer attack first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
  end
  # defense second
  if square.nil?
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end
  if square.nil? && brd[5] == INITIAL_MARKER
    square = 5
  elsif square.nil?
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
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
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def who_goes_first
  user_input = ' '
  loop do
    prompt 'Who gets to go first?'
    prompt 'Press 1 for the Player'
    prompt 'Press 2 for the Computer'
    user_input = gets.chomp.to_i
    break if user_input == 1 || user_input == 2
    prompt "Sorry, that's not a valid choice."
  end

  if user_input == 1
    'player'
  elsif user_input == 2
    'computer'
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

def place_piece!(board, current_player)
  if current_player == 'player'
    player_places_piece!(board)
  elsif current_player == 'computer'
    computer_places_piece!(board)
  end
end

player_score = 0
computer_score = 0

loop do
  board = intialize_board
  puts 'First one to win 5 games wins the match!'

  current_player = if who_goes_first == 'player'
                     'player'
                   else
                     'computer'
                   end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  if detect_winner(board) == 'Player'
    player_score += 1
  elsif detect_winner(board) == 'Computer'
    computer_score += 1
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Player score is: #{player_score}"
  puts
  prompt "Computer score is: #{computer_score}"
  puts

  if player_score == 5
    puts 'Player wins the match'
    break
  elsif player_score == 5
    puts 'Computer wins the match'
    break
  end

  prompt 'Do you want to play again? (y or n)'
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt 'Thank you for play Tic Tac Toe. Goodbye!'
