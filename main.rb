# require_relative lib/game
# 0
class Lobby
  def initialize
    puts %(Welcome to Tic-Tac-Toe!

  1 2 3
a x| |o
b o|x|
c o| |x

)
    player_start
  end

  private

 #1
  def player_start
    start = ''
    until start == 'N'
      print 'would you like to play a game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def new_game
    @game = Game.new

  end
end

#2 
class Game
  attr_accessor :places

 def initialize 
  @@places = {
    'a1' => '_', 'a2' => '_', 'a3' => '_',
    'b1' => '_', 'b2' => '_', 'b3' => '_',
    'c1' => ' ', 'c2' => ' ', 'c3' => ' '
  }
  play

 end

def puts_board
puts "#{@@places['a1']}|#{@@places['a2']}|#{@@places['a3']}"
puts "#{@@places['b1']}|#{@@places['b2']}|#{@@places['b3']}"
puts "#{@@places['c1']}|#{@@places['c2']}|#{@@places['c3']}"
end

def change_grid(key, symbol)
  @@places[key] = symbol
  puts_board
end

def player_1
  puts "player 1 move?"
  key = gets.chomp
  change_grid(key, "X")
  end

def player_2
  puts "player 2 move?"
  key = gets.chomp
  change_grid(key, "O")
  end

def play
  9.times do
    player_1
    player_2
  end
  puts 'thanks for playing!'
end

#3
def winner
#print winning player 
print "hooray, #{winner} wins!"
player_continue
end

#4
def player_continue
  continue = ''
  until continue == 'N'
    print 'would you like to play another game? (Y/N)'
    continue = gets.upcase.chomp
    new_game if continue == 'Y'
  end
end
end


Lobby.new

