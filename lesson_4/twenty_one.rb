require 'pry'

# Pseudo Code
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#  - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#  - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# You start with a normal 52-card deck consisting of the 4 suits (hearts, diamonds, clubs, and spades), and 13 values (2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace).

# Need to add ACE later
HEARTS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze
DIAMONDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze
CLUBS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze
SPADES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze

suits = ['HEARTS', 'DIAMONDS', 'CLUBS', 'SPADES']

def pick_random_suit(suits)
  suits.sample
end

def pick_random_card(random_suit)
  Object.const_get(random_suit).sample
end

def deal(random_suit, random_card)
  [ { random_suit => random_card } ]
end

player = Array.new

2.times do
  random_suit = pick_random_suit(suits)
  random_card = pick_random_card(random_suit)
  if player.empty?
    player = deal(random_suit, random_card)

  else
    player << deal(random_suit, random_card)
  end
end
puts "#{player.inspect}"
