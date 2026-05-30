# frozen_string_literal: true

require_relative 'hangman'
# Represents the actual game
class Game
  attr_accessor :hangman

  def initialize(word = '', guesses = [], path = 'resources/google-10000-english-no-swears.txt')
    @path = path
    @hangman = Hangman.new(word, guesses)
    return unless @hangman.word.empty?

    @hangman.word = get_word(path)
  end

  def get_word(path)
    words = File.readlines(path)
    loop do
      random_index = rand(words.length)
      return words[random_index] if words[random_index].length >= 5 && words[random_index].length <= 12
    end
  end
end
