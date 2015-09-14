class TicTacToe
  def initialize
    @spaces = [1,2,3,4,5,6,7,8,9]

    @player_1_choice = 0
    @player_2_choice = 0

    @winning_row = [
      [1,2,3],
      [4,5,6],
      [7,8,9],
      [1,4,7],
      [2,5,8],
      [3,6,9],
      [1,5,9],
      [3,5,7]
    ]
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

  def start_game
    multi_player_mode
  end

  # def single_player_mode
  # end

  def multi_player_mode
    puts "Player 1, enter your name:"
    name = gets.chomp
    player_1 = Player.new(name)
    puts "#{player_1.name} will be X."
    puts "---"
    puts "Player 2, enter your name:"
    name = gets.chomp
    player_2 = Player.new(name)
    puts "#{player_2.name} will be O."
  end
end

game = TicTacToe.new
puts "Prepare to play Tic Tac Toe!"
game.start_game
