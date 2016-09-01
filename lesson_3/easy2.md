1. ages.assoc("Spot")
  ages.include?("Spot")
  ages.member?("Spot")

2.  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
    total = 0
      ages.each do |key, value|
        total = value + total
      end
    p total

    # below was the books answer

    ages.values.inject(:+)
