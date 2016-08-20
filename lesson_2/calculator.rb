require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def operation_to_message(op)
  word = case op
  when '1', 'add', '+'
    'Adding'
  when '2', 'subtract', '-'
    'Subtracting'
  when '3', 'multiply', '*'
    'Multiplying'
  when '4', 'divide', '/'
    'Dividing'
  end

  x = 'a random line of code'

  # if we wanted to add code after the case statement, we would need to save the
  # return value of the case into a variable, then make sure to return that
  # variable, or that variable must be the last line in the method.

  word
end

prompt(MESSAGES['welcome'])
name = ''

loop do
  name = gets.chomp
  if name.empty? # yes I am aware rubocop would like a guard clause.
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}")

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt(MESSAGES['enter_number'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loop do
    prompt(MESSAGES['enter_2nd_number'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  #operator_prompt = <<-MSG
  #  What operation would you like performed?
  #  1. add +
  #  2. subtract  -
  #  3. multiply *
  #  4. divide /
  #MSG
  operator = ''

  loop do
    prompt(MESSAGES['operator_prompt'])
    # prompt operator_prompt # remove option () i.e. prompt(operator_prompt)
    operator = gets.chomp

    if %w(1 2 3 4 add subtract multiply divide + - * /).include?(operator)
      break
    else
      prompt(MESSAGES['must_choose'])
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
  prompt(MESSAGES['another_try'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
