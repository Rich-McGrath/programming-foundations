1. nil / bug

2.  {:a=>"hi there"}

3. A) one is: one
      two is: two
      three is: three

  B) one is: one
     two is: two
     three is: three

  C) one is: two
     two is: three
     three is: one

 4. require 'securerandom'
    SecureRandom.uuid

    for books answer see: random_uuid.rb

  5. see ip_address.rb

      # Below is the book example

  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    return false unless dot_separated_words.size == 4

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
      end

      true
  end
