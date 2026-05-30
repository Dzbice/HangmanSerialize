require_relative 'lib/game'
require_relative 'lib/hangman'

def integer?(str)
  !Integer(str, exception: false).nil?
end

def game(in_game = Game.new)
  game = in_game
  game.main_loop
end

def check_save_choice(input, size)
  return if integer?(input) || input.to_i > size || input.to_i < 1

  true
end

def load_game
  saves = Dir.glob('saves/*.dump')
  if saves.empty?
    puts 'no saves'
    return
  end
  saves.each_with_index { |x, i| puts "#{i + 1}: #{x}" }

  loop do
    puts 'choose a save by number'
    input = gets.chomp
    unless check_save_choice(input, saves.size)
      game(Marshal.load(File.read(saves[input.to_i - 1])))
      break
    end
  end
end

loop do
  puts "1: Load Save \n2: New Game\n3:Exit"
  x = gets.chomp
  load_game if x == '1'
  game if x == '2'
  break if x == '3'
end
