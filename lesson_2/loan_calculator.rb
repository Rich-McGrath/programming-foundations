
puts 'Please enter in the loan amount.'
loan_amount = gets.chomp.gsub(',', '')
loan_amount_to_f = loan_amount.to_f
puts "Loan Amount #{loan_amount_to_f}"
puts 'Please enter in the number of years for the loan.'
loan_period = gets.chomp
loan_in_months = 12 * loan_period.to_i
puts "Loan in monhts #{loan_in_months}"
puts 'Please enter in the Annual Percentrage Rate.'
apr = gets.chompgsub('%', '')
monthly_interest_rate = (apr.to_f / 100) / 12
puts "Monthyl interest rate #{monthly_interest_rate}"

monthly_payment = loan_amount_to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)** - loan_in_months))

puts "Your monthly payment is $#{monthly_payment}"
