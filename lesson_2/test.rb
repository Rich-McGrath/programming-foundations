VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 's' => 'scissors',
                  'l' => 'lizard', 'sp' => 'spock' }.freeze

WIN = %w( rockscissors rocklizard paperrock paperspock scissorspaper
          sicssorslizard lizardspock lizardpaper spockscissors spockrock).freeze

player = 'paper'
computer = 'scissors'

WIN.each do |winner|
  if player + computer == winner
    puts 'player wins'

    break
  elsif computer + player == winner
    puts 'computer wins'
    break
  elsif player == computer
    puts 'It is a tie!'
    break
  end
end
