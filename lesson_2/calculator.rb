def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.nonzero?
end

def operation_to_message(op)
  case op
  when '1', 'add', '+'
    'Adding'
  when '2', 'subtract', '-'
    'Subtracting'
  when '3', 'multiply', '*'
    'Multiplying'
  when '4', 'divide', '/'
    'Dividing'
  end
end

prompt('Welcome to Calculator! Enter your name:')
name = ''

loop do
  name = gets.chomp
  if name.empty?
    prompt('Make sure to use a valid name.')
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt('Please enter in a number:')
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt("Hmmm... that dosen't look like a valide number")
    end
  end

  loop do
    prompt('Please enter in a second number:')
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt("Hmmm... that dosen't look like a valide number")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like performed?
    1. add +
    2. subtract  -
    3. multiply *
    4. divide /
  MSG
  operator = ''

  loop do
    prompt(operator_prompt)
    operator = gets.chomp

    if %w(1 2 3 4 add subtract multiply divide + - * /).include?(operator)
      break
    else
      prompt("Must choose: 1. add + | 2. subtract  - | 3. multiply * | 4. divide / ")
    end
  end

  # **** This is my original logic *****
  # if operation == '1' || operation == 'add' || operation == '+'
  #  prompt("#{number1} + #{number2} = #{number1.to_i + number2.to_i}")
  # elsif operation == '2' || operation == 'subtract' || operation == '-'
  #  prompt("#{number1} - #{number2} = #{number1.to_i - number2.to_i}")
  # elsif operation == '3' || operation == 'multiply' || operation == '*'
  #  prompt("#{number1} * #{number2} = #{number1.to_i * number2.to_i}")
  # elsif operation == '4' || operation == 'divide' || operation == '/'
  #  prompt("#{number1} / #{number2} = #{number1.to_f / number2.to_f}")
  # else
  #  prompt('You did not enter in an operator')
  # end
  # **** End of my Original logic ****

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator.downcase
           when '1', 'add', '+'
             number1.to_i + number2.to_i
           when '2', 'subtract', '-'
             number1.to_i - number2.to_i
           when '3', 'multiply', '*'
             number1.to_i * number2.to_i
           when '4', 'divide', '/'
             number1.to_f / number2.to_f
           end

  prompt("The results is #{result}")
  prompt('Do you want to perform another calculation? (y to calculate again)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using the calculator. Goodbye!')
