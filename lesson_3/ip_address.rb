require 'pry'
def user_input_a_number?(character)
  to_integer = character.to_i
  to_integer.to_s == character
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split('.')
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if word.size > 3
    return false unless user_input_a_number?(word)
  end
  true
end

puts 'Please enter in an IP address'
user_ip = gets.chomp

if dot_separated_ip_address?(user_ip)
  puts "Hooray! You entered in a valid IP of #{user_ip}"
else
  puts "You entered #{user_ip} which is not a valid IP"
end
