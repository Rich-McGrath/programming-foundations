def a_number?(character)
  to_integer = character.to_i
  to_integer.to_s == character
end

def valid_ip?(character)
  character.size == 3
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  word = dot_separated_words.pop
  joined_words = dot_separated_words.join
  return false if !valid_ip?(word) || !a_number?(joined_words)
end

puts 'Please enter in an IP address'
user_ip = gets.chomp

if dot_separated_ip_address?(user_ip) == false
  puts "You entered #{user_ip} which is not a valid IP"
else
  puts "Hooray! You entered in a valid IP of #{user_ip}"
end
