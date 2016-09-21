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

SUITS = ['HEARTS', 'DIAMONDS', 'CLUBS', 'SPADES'].freeze

def pick_random_suit
  SUITS.sample
end

def pick_random_card_value(random_suit)
  Object.const_get(random_suit).sample
end

def give_card_to_player(random_suit, random_card)
  [{ random_suit => random_card }]
end

current_player = nil

2.times do
  if current_player.nil?
    current_player = give_card_to_player(pick_random_suit, pick_random_card_value(pick_random_suit))
  else
    current_player << give_card_to_player(pick_random_suit, pick_random_card_value(pick_random_suit))
  end
end
puts "#{current_player.inspect}"
