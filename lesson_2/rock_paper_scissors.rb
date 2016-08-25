VALID_CHOICES = %w(rock paper scissors lizard spock).freeze

def test_method
  prompt('test message')
end

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  # rock winning options
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    # paper winning options
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && seoond == 'spock') ||
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

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    break if VALID_CHOICES.include?(choice.downcase)
    prompt("That's not a valid choice")
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Goodbye!')
