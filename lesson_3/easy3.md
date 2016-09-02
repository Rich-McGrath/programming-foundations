1. flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
   flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

2. flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
   flintstones << 'Dino'

3. flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
   flintstones.push('Dino', 'Hoppy')
   flintstones.concat(['Dino', 'Hoppy'])

   # below are the book answers
   flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
   flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item

4. advice = "Few things in life are as important as house training your pet dinosaur."
   advice.slice!(39..72)
   <!-- advice.slice!(/house.*/) -->

   # below is the book example
   advice.slice!(0, advice.index('house'))

5. statement = "The Flintstones Rock!"
   statement.count 't'

   # below is the book example
   statement.scan('t').count

6. title = 'Flintstone Family Members'
   title.center(160)  

   #below was the book answers
    title.center(40) 
