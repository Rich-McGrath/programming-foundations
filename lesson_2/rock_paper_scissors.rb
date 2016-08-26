VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                  'l' => 'lizard', 'sp' => 'spock' }.freeze

WIN = %w( rockscissors rocklizard paperrock paperspock scissorspaper
          sicssorslizard lizardspock lizardpaper spockscissors spockrock).freeze

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  merge_words = first + second
  WIN.include? merge_words
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

def letter_to_word(letter)
  VALID_CHOICES[letter]
end

def valid_values?(user_enter_choice)
  VALID_CHOICES.value?(user_enter_choice)
end

def valid_keys?(user_enter_choice)
  VALID_CHOICES.key?(user_enter_choice)
end
player_score = 0
computer_score = 0

puts 'Welcome to Rock, Paper, Scissors, Lizzard, Spock!'
puts 'First one to five wins!'

loop do
  user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES}")
    user_choice = gets.chomp.downcase

    break if valid_values?(user_choice) || valid_keys?(user_choice)
    prompt("That's not a valid choice")
  end

  # If user enters in letter will Reassign to matching word.
  if valid_keys?(user_choice)
    user_choice = letter_to_word(user_choice)
  end

  computer_choice = VALID_CHOICES.values.sample

  prompt("You chose: #{user_choice}; Computer chose: #{computer_choice}")

  display_results(user_choice, computer_choice)

  # I have tried for some time to get the if statement below into a method but,
  # I have not successfullly pulled it off. Any gudiance you can provide is
  # greatly appreciated. Please see the commented out method above.

  # score(user_choice, computer_choice)

  if win?(user_choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, user_choice)
    computer_score += 1
  end

  if player_score == 5
    puts 'You are the first to 5 wins!'
    break
  elsif computer_score == 5
    puts 'The computer was the first to 5 win, you lose!'
    break
  end

  prompt('Do you want to play again?')
  prompt('Press any key to contune or q to quit')
  answer = gets.chomp.downcase

  break if answer == 'q'
end
prompt('Thank you for playing. Goodbye!')
