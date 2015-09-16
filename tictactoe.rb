require_relative 'player'
require 'pry'

class TicTacToe
  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9]
    @winning_rows = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
      @turn_count = 0
  end

  def game_board
    puts %{
      #{@spaces[0]}  |  #{@spaces[1]}  |  #{@spaces[2]}
    -----+-----+-----
      #{@spaces[3]}  |  #{@spaces[4]}  |  #{@spaces[5]}
    -----+-----+-----
      #{@spaces[6]}  |  #{@spaces[7]}  |  #{@spaces[8]}
    }
  end

  def valid_move?(position)
    @spaces[position-1] != "o" && @spaces[position-1] != "x"
  end

  def player_1_turn
    game_board
    puts "Make your move #{@player_1.name.upcase}:"
    player_choice = gets.chomp.to_i
    until valid_move?(player_choice)
      puts "Invalid choice.. please make another choice!"
      player_choice = gets.chomp.to_i
    end
    @spaces[player_choice - 1] = "X"
    game_board
    @turn_count += 1
    print "Round: #{@turn_count}\n"
  end

  def player_2_turn
    game_board
    puts "Make your move #{@player_2.name.upcase}:"
    player_choice = gets.chomp.to_i
    until valid_move?(player_choice)
      puts "Invalid choice.. please make another choice!"
      player_choice = gets.chomp.to_i
    end
    @spaces[player_choice - 1] = "O"
    game_board
    @turn_count += 1
    print "Round: #{@turn_count}\n"
  end

  def start_game
    multi_player_mode
  end

  def play
    while @turn_count < 7
      player_1_turn
      if winner_chicken_dinner('X')
        puts "Winner Winner Chicken Dinner! #{@player_1.name.upcase} WINS!"
        exit
      end
      player_2_turn
      if winner_chicken_dinner('O')
        puts "Winner Winner Chicken Dinner! #{@player_2.name.upcase} WINS!"
        exit
      end
    end
    puts "It's a TIE!"
  end

  def winner_chicken_dinner(xo)
    @winning_rows.any? { |winning_row|
      winning_row.all? { |position| @spaces[position-1] == xo } }
  end

  # def single_player_mode
  # end

  def multi_player_mode
    puts "Player 1, enter your Name:"
    name = gets.chomp
    @player_1 = Player.new(name)
    puts "#{@player_1.name.upcase} will be X."
    puts "---"
    puts "Player 2, enter your Name:"
    name = gets.chomp
    @player_2 = Player.new(name)
    puts "#{@player_2.name.upcase} will be O."
    play
  end
end

game = TicTacToe.new
puts "Prepare to play Tic Tac Toe!"
game.start_game
