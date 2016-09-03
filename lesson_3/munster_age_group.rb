munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


munsters.each do |key, value|
  case
    when value['age'] <= 17
      value[:age_group] = 'kid'
    when value['age'] >= 19 && value['age'] < 64
      value[:age_group] = 'adult'
    when value['age'] >= 64
      value[:age_group] = 'senior'
  end
end

p munsters


# below is the books example
# musters.each do |name, detals
#  case details['age']
#  when 0...19
#    details["age_group"] = "kid"
#  when 18...65
#    details["age_group"] = "adult"
#  else
#    details["age_group"] = "senior"
#  end
# end
