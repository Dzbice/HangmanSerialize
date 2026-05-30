# Represents our hangman
class Hangman
  attr_accessor :word, :guesses

  def initialize(word = '', guesses = [])
    @word = word
    @guesses = guesses
  end
end
