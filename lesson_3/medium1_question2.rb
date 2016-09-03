statement = 'The Flintstones Rock'
character_hash = {}
statement.gsub!(/\s+/, '').downcase!.each_char do |char|
  character_hash[char] = statement.count(char)
end

p character_hash

# below was the books answer to this code

#result = {}
#letters = ('A'..'Z').to_a + ('a'..'z').to_a
#letters.each do |letter|
#  letter_frequency = statement.scan(letter).count
#  result[letter] = letter_frequency if letter_frequency > 0
# end
