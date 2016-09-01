1. 1, 2, 2, 3

2.  a.!= Not equal.
    b. ! or ? at the end of the method, it's part of the method name.
    c.  ? : the ternary operator for if else
    d. !! turn any object into their boolean equivalent
    e. ! turn any object into the opposite of their boolean equivalent

3. advice.gsub('important', 'urgent')

4. numbers.delete_at(1) = removes whats is stored at position 1
   numbers.delete(1) = removes the number 1

5. I was unsuccessful going the bsearch route.
    #book answer is
    (10..100).cover?(42)

6. famous_words_begin = 'Four score and '
   puts famous_words_begin + famous_words

   "Fours score and " << famous_words

   #book extra example
   famous_words.prepend('Four score and ')

7. 42

8. flintstones.flatten!

9. flintstones.assoc("Barney")

10. flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
    flintstones.each_with_index do |name, index|
      flintstones_hash[name] = index
    end
