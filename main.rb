class Mastermind
  def initialize
    puts 'Welcome to Mastermind!'
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

class Game
  attr_reader :code
  attr_accessor :correct, :contains, :turn_count, :user_guess

  def initialize
    @code = Array.new(4) { Random.rand(1...6) }
    @user_guess = []
    @correct = 0
    @contains = 0
    @turn_count = 0
    puts 'you have 9 rounds to guess the 4-digit code.'
    puts 'the code is 4 digits, numbers 1-6.'
    puts 'the computer will let you know a) if you have correct numbers, and b) if any of those numbers are in the correct position.'
    puts "computer code = #{@code}"
    turn
  end

  def turn
    @turn_count += 1
    @contains = 0
    @correct = 0
    puts 'guess the code:'
    @user_guess = gets.chomp
    turn_check
  end

  def turn_check
      if @user_guess.length == 4 && @user_guess =~ /[0-6]{4}/
      @user_guess = @user_guess.split('').map(&:to_i)
      match_check
     
      else
      error
  
    end
  end

  def error
    puts 'Invalid input. please enter 4 numbers between 1 and 6'
    turn
  end

  def match_check
    matches = (@user_guess & @code).flat_map { |n| [n] * [@user_guess.count(n), @code.count(n)].min }
    @contains = matches.size
    pos_check
  end

  def pos_check
    comparison_pairs = @code.zip(@user_guess)
    @correct = comparison_pairs.select { |pair| pair[0] == pair[1] }.count
    cont_check
  end

  def cont_check
    if @user_guess == @code
      win
    elsif @turn_count == 10
      lose
    else
      puts "guess contains #{@contains} correct numbers"
      puts "guess contains #{@correct} correct numbers, in the correct position"
      turn
    end
  end

  def win
    puts 'you win!!'

    start = ''
    until start == 'N'
      print 'would you like to play another game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def lose
    puts 'you lost!'
    start = ''
    until start == 'N'
      print 'would you like to play another game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def new_game
    Game.new
  end
end

Mastermind.new
