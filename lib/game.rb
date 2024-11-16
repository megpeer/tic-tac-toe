# require_relative '../main.rb'
# welcome to the lobby
class Lobby
  def initialize
    puts %(Tic-Tac-Toe!

       1   2   3
    a    |   |
      ---+---+---
    b    |   |
      ---+---+---
    c    |   |

    )
    player_start
  end

  def player_start
    start = ''
    until start == 'N'
      print 'would you like to play a game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def new_game
    Game.new
  end
end
# welcome to the game
class Game
  attr_accessor :places, :turn_count

  def initialize
    @turn_count = 1
    @places = {
      'a1' => ' ', 'a2' => ' ', 'a3' => ' ',
      'b1' => ' ', 'b2' => ' ', 'b3' => ' ',
      'c1' => ' ', 'c2' => ' ', 'c3' => ' '
    }

  end

  def puts_board
    puts ''
    puts " #{@places['a1']} | #{@places['a2']} | #{@places['a3']} "
    puts '---+---+---'
    puts " #{@places['b1']} | #{@places['b2']} | #{@places['b3']} "
    puts '---+---+---'
    puts " #{@places['c1']} | #{@places['c2']} | #{@places['c3']} "
    puts ''
  end

  def change_grid(key, symbol)
    @places[key] = symbol
    puts_board
    check_win
  end

  # def player1
  #   puts 'player 1 move:'
  #   key = gets.downcase.chomp

  #   if @places[key] != ' '

  #     error_move
  #   else
  #     change_grid(key, 'x')

  #   end
  # end

  def player2
    puts 'player 2 move:'
    key = gets.downcase.chomp
    if @places[key] != ' '
      error_move

    else
      change_grid(key, 'o')

    end
  end

  def error_move
    puts 'invalid space.'
    puts 'space must be unoccupied or a valid coordninate (like a1, b2 or c3)'
    puts 'please choose another space!'
    play
  end

  def check_win
    @turn_count += 1
    # columns
    # 1
    if @places['a1'] == 'x' && @places['b1'] == 'x' && @places['c1'] == 'x'
      x_win
    elsif @places['a1'] == 'o' && @places['b1'] == 'o' && @places['c1'] == 'o'
      o_win

    # 2
    elsif @places['a2'] == 'x' && @places['b2'] == 'x' && @places['c2'] == 'x'
      x_win
    elsif @places['a2'] == 'o' && @places['b2'] == 'o' && @places['c2'] == 'o'
      o_win

    # 3
    elsif @places['a3'] == 'x' && @places['b3'] == 'x' && @places['c3'] == 'x'
      x_win
    elsif @places['a3'] == 'o' && @places['b3'] == 'o' && @places['c3'] == 'o'
      o_win

    # rows
    # a
    elsif @places['a1'] == 'x' && @places['a2'] == 'x' && @places['a3'] == 'x'
      x_win
    elsif @places['a1'] == 'o' && @places['a2'] == 'o' && @places['a3'] == 'o'
      o_win

    # b
    elsif @places['b1'] == 'x' && @places['b2'] == 'x' && @places['b3'] == 'x'
      x_win
    elsif @places['b1'] == 'o' && @places['b2'] == 'o' && @places['b3'] == 'o'
      o_win

    # c
    elsif @places['c1'] == 'x' && @places['c2'] == 'x' && @places['c3'] == 'x'
      x_win
    elsif @places['c1'] == 'o' && @places['c2'] == 'o' && @places['c3'] == 'o'
      o_win

    # diagonals
    # \
    elsif @places['a1'] == 'x' && @places['b2'] == 'x' && @places['c3'] == 'x'
      x_win
    elsif @places['a1'] == 'o' && @places['b2'] == 'o' && @places['c3'] == 'o'
      o_win

    # /
    elsif @places['c1'] == 'x' && @places['b2'] == 'x' && @places['a3'] == 'x'
      x_win
    elsif @places['c1'] == 'o' && @places['b2'] == 'o' && @places['a3'] == 'o'
      o_win

    else

      play
    end
  end
end

def x_win
  puts 'x wins!!'
  Lobby.new
end

def o_win
  puts 'o wins!!'
  Lobby.new
end

def play
  if @turn_count == 10
    puts "it's a tie!! nobody wins!"
    Lobby.new
  elsif @turn_count.odd?
    player1
  else
    player2
  end
end