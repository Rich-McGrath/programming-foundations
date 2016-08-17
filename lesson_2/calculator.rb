puts 'Please enter in a number:'
number1 = gets.chomp
puts 'Please enter in a second number:'
number2 = gets.chomp

puts 'What operation would you like performed:'
puts "1. add(+) 2. subtract(-) 3. multiply(*) 4. divide(/)?"
operation = gets.chomp

if operation == '1' || operation == 'add' || operation == '+'
  puts "#{number1} + #{number2} = #{number1.to_i + number2.to_i}"
elsif operation == '2' || operation == 'subtract' || operation == '-'
  puts "#{number1} - #{number2} = #{number1.to_i - number2.to_i}"
elsif operation == '3' || operation == 'multiply' || operation == '*'
  puts "#{number1} * #{number2} = #{number1.to_i * number2.to_i}"
elsif operation == '4' || operation == 'divide' || operation == '/'
  puts "#{number1} / #{number2} = #{number1.to_f / number2.to_f}"
else
  puts 'You did not enter in an operator'
end
