#def factors(number)
#  dividend = number
#  divisors = []
#  begin
#    divisors << number / dividend if number % dividend == 0
     dividend -= 1
#  end until dividend == 0
#  divisors
# end

# p factors(1)

def factors(number)
  dividend = number
  divisors = []
    while dividend > 0 do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
      p dividend
    end
end

factors(10)
