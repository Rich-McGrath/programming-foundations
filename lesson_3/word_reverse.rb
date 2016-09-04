sentence = 'Humpty Dumpty sat on a wall.'

# Below would be a quick away to do this but not what was asked for.
# puts sentence.reverse.to_s

# I missunderstood this question.

words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

p backwards_sentence
