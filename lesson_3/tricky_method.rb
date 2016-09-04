
def tricky_method_string(a_string_param)
  a_string_param += "rutabaga"
 end

 def tricky_method_array(an_array_param)
  an_array_param << "rutabaga"
 end


 my_string = "pumpkins"
 my_array = ["pumpkins"]
 my_string = tricky_method_string(my_string)
 my_array = tricky_method_array(my_array)

 puts "My string looks like this now: #{my_string}"
 puts "My array looks like this now: #{my_array}"

# Below is the books answer.

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts '--------------------------------------------------------------------'
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
