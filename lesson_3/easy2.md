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

3.  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
    ages.each do |key, value|
      ages.delete(key) if value >= 100
    end
    p ages

    #second answer
    ages.delete_if { | key, value | value >= 100 }

    # below is the book answer

    ages.delete_if { | key, value| value >= 100 }

4.  munsters_description = "The Munsters are creepy in a good way."

    p munsters_description.capitalize
    p munsters_description.swapcase
    p munsters_description.downcase
    p munsters_description.upcase

5. ages.merge!(additional_ages)

6.
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  youngest_age = ages.values.sort.each
  p youngest_age.first

  # below is the book solution
  ages.values.min

7.
  advice.include?("Dino")

  # below is the books solution
  advice.match("Dino")

8. # below is the book example
    flintstones.index { |name| p name[0, 2]  == "Be" }

9. flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

   p flintstones.collect { |name| name[0, 3] }

   # below is book example

   flintstones.map! do |name|
    name[0, 3]
  end

10. p flintstones.collect { |name| name[0, 3] }

    # below is book example
    p flintstones.map! { |name| name[0, 3] }
