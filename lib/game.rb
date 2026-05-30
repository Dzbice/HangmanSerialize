# frozen_string_literal: true

require_relative 'hangman'
# Represents the actual game
class Game
  attr_accessor :hangman

  def initialize(path = 'resources/google-10000-english-no-swears.txt')
    @path = path
    word = get_word(path)
    @hangman = Hangman.new(word)
  end

  def get_word(path)
    words = File.readlines(path)
    loop do
      random_index = rand(words.length)
      return words[random_index].chomp if words[random_index].length >= 5 && words[random_index].length <= 12
    end
  end

  def main_loop
    loop do
      break if @hangman.fail?
      break if @hangman.complete?

      puts @hangman
      puts 'enter a letter'
      input = gets.chomp
      next unless input =~ /[a-zA-z]/ && input.size == 1

      @hangman.right?(input)
    end
  end
end
