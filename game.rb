class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    puts "Enter Piece for Player One"
    @player1_piece =  gets.chomp.to_s
    puts "Enter Piece for Player Two"
    @player2_piece = gets.chomp.to_s
    puts "Type of play: 1 for human v. human, 2 for computer v. computer, 3 human v. computer"
    @num_of_type_of_play = gets.chomp.to_i
    puts "Who goes first? 1 for player one or 2 for player two"
    first_player_to_take_turn = gets.chomp.to_i

  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    puts "Please select your spot by typing a number from 0 to 8"
    until game_is_over(@board) || tie(@board)
      type_of_play(@num_of_type_of_play)
      puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    end
  end


  def type_of_play(number_of_type_of_play)
    if number_of_type_of_play == 1

    elsif number_of_type_of_play == 2

    elsif number_of_type_of_play == 3
      if !game_is_over(@board) && !tie(@board) && get_human_spot
        computer_ai_for_picking_spot
      end
    else
      puts "Error, wrong type of play was selected, enter a valid entry of play"
      type_of_play = gets.chomp.to_i
    end
  end

  def who_goes_first(player_number)
  end

  def get_human_spot(player_piece = @player2_piece, opposing_player_piece = @player1_piece)
    spot = nil
    until spot != nil
      puts "Enter a spot"
      spot = gets.chomp.to_i
        if @board[spot] != @player1_piece.to_s && @board[spot] != @player2_piece.to_s && check_valid_input(spot)
          @board[spot] = @player2_piece
          return true
        else
          puts "#{spot} is not a valid spot" 
          spot = nil
          return false

      end
    end
  end

  #Should check a number spot and see if it's valid

  def check_valid_input(user_input)
    validspots = *(0..8)
    if  validspots.include?(user_input)
      return true
    else
      return false

    end
  end

# Computer AI
  def computer_ai_for_picking_spot(current_player_piece = @player1_piece, opposing_player_piece = @player2_piece)
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @player1_piece
      else
        spot = get_best_move(@board, @player1_piece)
        if @board[spot] != @player1_piece.to_s && @board[spot] != @player2_piece.to_s
          @board[spot] = @player1_piece
          puts "Computer choose #{spot}"
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |space|
      if space != @player1_piece.to_s && space != @player2_piece.to_s
        available_spaces << space
      end
    end
    available_spaces.each do |availspace|
      board[availspace.to_i] = @player1_piece
      if game_is_over(board)
        best_move = availspace.to_i
        board[availspace.to_i] = availspace
        return best_move
      else
        board[availspace.to_i] = @player2_piece
        if game_is_over(board)
          best_move = availspace.to_i
          board[availspace.to_i] = availspace
          return best_move
        else
          board[availspace.to_i] = availspace
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(b)
    

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1

    
  end

  def tie(b)
    b.all? { |s| s == @player1_piece.to_s || s == @player2_piece.to_s }
  end

end

game = Game.new
game.start_game
