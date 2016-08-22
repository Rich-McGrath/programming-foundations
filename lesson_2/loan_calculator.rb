def valid_number?(num)
  num.to_i.to_s == num
end

def valid_float?(float)
  if float.match('.00')
    float_increment = 0.01 + float.to_f
    float_increment.to_s == float.gsub('.00', '.01')
  else
    float.to_f.to_s == float
  end
end

loop do
  loan_amount = ''
  loop do
    puts 'Please enter in the loan amount.'
    loan_amount = gets.chomp.gsub(',', '')
    if valid_number?(loan_amount) || valid_float?(loan_amount)
      break
    else
      puts 'Please enter in a valid number.'
    end
  end

  loan_in_months = ''

  loop do
    puts 'Please enter in the number of years for the loan.'
    loan_period = gets.chomp
    if valid_number?(loan_period)
      loan_in_months = 12 * loan_period.to_i
      break
    else
      puts 'Please enter in a valid number.'
    end
  end

  monthly_interest_rate = ''
  loop do
    puts 'Please enter in the Annual Percentrage Rate.'
    apr = gets.chomp.gsub('%', '')
    if valid_float?(apr) || valid_number?(apr)
      monthly_interest_rate = (apr.to_f / 100) / 12
      break
    else
      puts 'Please enter in a valid number.'
    end
  end

  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (
                      1 + monthly_interest_rate)**- loan_in_months))

  puts "Your monthly payment is $#{monthly_payment.round(2)}"

  puts 'Would you like to calculate another loan? (press y)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
