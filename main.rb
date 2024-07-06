require_relative lib/game

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
    puts 'let the games begin...'
  end
end

Lobby.new
