def fib(first_num, second_num, limit)
# limit = 15 my solution was to define it in the lopp book said to pass it
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# limit was defined before fib is called and is not visible in the scope loop.
