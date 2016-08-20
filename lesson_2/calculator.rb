def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  #num.to_i.nonzero?
  #num.to_i >= 0
  num.to_i.to_s == num
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
  if name.empty? # yes I am aware rubocop would like a guard clause.
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
    prompt operator_prompt # remove option () i.e. prompt(operator_prompt)
    operator = gets.chomp

    if %w(1 2 3 4 add subtract multiply divide + - * /).include?(operator)
      break
    else
      prompt('Must choose: 1. add + | 2. subtract  - | 3. multiply *
            | 4. divide / ')
    end
  end

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
