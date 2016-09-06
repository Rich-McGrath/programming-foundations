require 'pry'
def is_a_number?(character)
  to_integer = character.to_i
  to_integer.to_s == character
end

def is_valid_ip?(character)
  character.length >= 4 && character.length <= 12
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  #binding.pry
  if !is_valid_ip?(dot_separated_words.join) || !is_a_number?(dot_separated_words.join)
    return false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return true
    end
  end
end

puts 'Please enter in an IP address'
user_ip = gets.chomp

if dot_separated_ip_address?(user_ip) == false
  puts "You entered #{user_ip} which is not a valid IP"
else
  puts "Hooray! You entered in a valid IP!"
end
