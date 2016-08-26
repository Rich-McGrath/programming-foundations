VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  # rock winning options
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    # paper winning options
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    # sicssors winnig options
    (first == 'sicssors' && second == 'paper') ||
    (first == 'sicssors' && second == 'lizard') ||
    # lizard winning options
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    # spock winnning options
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

#
# def score(choice, computer_choice)
#  if win?(choice, computer_choice)
#    player_score =+ 1
#  elsif win?(computer_choice, choice)
#    computer_score =+ 1
#  end
# end

def letter_to_word(letter)
  if letter == 'r'
    'rock'
  elsif letter == 'p'
    'paper'
  elsif letter == 's'
    'scissors'
  elsif letter == 'l'
    'lizard'
  elsif letter == 'sp'
    'spock'
  end
end

player_score = 0
computer_score = 0

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp.downcase

    # This will convert users 1 letter input to the correct word
    break if choice.length > 2
    choice = letter_to_word(choice)

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  # I have tried for some time to get the if statement below into a method but,
  # I have not successfullly pulled it off. Any gudiance you can provide is
  # greatly appreciated. Please see the commented out method above.

  # score(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  break if player_score == 5
  puts 'You are the first to 5 wins!'
  break if computer_score == 5
  puts 'The computer was the first to 5 win, you lose!'

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
