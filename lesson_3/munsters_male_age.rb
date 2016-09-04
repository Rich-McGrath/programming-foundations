munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

total_male_age = 0
munsters.each do |key, value|
  if value['gender'] == 'male'
    total_male_age += value['age']
  end
end

puts "The total age of all the male munsters is #{male_age}"

# The below code is the books version

# total_male_age = 0
# munsters.each do |name, details|
  # total_male_age += dtails["age"] if details['gender'] == 'male'
# end
