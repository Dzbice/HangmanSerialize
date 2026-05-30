# Represents our hangman
class Hangman
  attr_accessor :word, :guesses, :correct, :incorrect

  def initialize(word)
    @word = word
    @guesses = []
    @correct = Array.new(@word.size, '_')
    @incorrect = 0
  end

  def complete?
    return unless @correct.join == @word

    puts "Good job! The word was #{@word}"
    true
  end

  def right?(letter)
    if @word.include?(letter)
      puts 'Correct'
      update_correct(letter)
    else
      puts 'Incorrect'
      @incorrect += 1
    end
    add_guess(letter)
  end

  def update_correct(letter)
    indexs = (0...@word.length).find_all { |i| word[i, 1] == letter.downcase }
    indexs.each { |x| @correct[x] = @word[x] }
  end

  def fail?
    return unless incorrect >= 6

    puts "fail, you dead, the word was #{@word}"
    true
  end

  def add_guess(input)
    @guesses.push(input)
  end

  def to_s
    "Size: #{@word.length}\n" \
    "Guesses: #{@guesses.join(',')}\n" \
    "Incorrects: #{@incorrect}/6\n" \
    "#{@correct.join}"
  end
end
