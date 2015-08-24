class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    while valid_inputs?
      puts "Enter Piece for Player One"
      @player1_piece =  gets.chomp.to_s
      puts "Enter Piece for Player Two"
      @player2_piece = gets.chomp.to_s
      puts "Type of play: 1 for human v. human, 2 for computer v. computer, 3 human v. computer"
      @num_of_type_of_play = gets.chomp.to_i
      puts "Who goes first? 1 for player one or 2 for player two"
      @first_player_to_take_turn = gets.chomp.to_i
    end
  end

  def valid_inputs? 
    if valid_pieces(@player1_piece,@player2_piece) and valid_player_number(@num_of_type_of_play) and valid_player_who_is_first(@first_player_to_take_turn)
      return false
    else
      return true
    end
  end

  def valid_pieces(player1_piece,player2_piece)
    invalid_pieces = (0..9).to_a
    if !invalid_pieces.include?(player1_piece) and  !invalid_pieces.include?(player2_piece) and player1_piece != nil and player2_piece.length != nil
      return true
    else
      puts "Player 1 Piece: #{player1_piece} or player 2 Piece: #{player2_piece}"
      return false
    end
  end

  def valid_player_number(num_of_play)
    valid_num_of_play = (0..3).to_a
    if valid_num_of_play.include?(num_of_play)
      return true
    else
      puts "Number of play: #{num_of_play} is not valid"
      return false
    end
  end

  def valid_player_who_is_first(first_player_to_take_turn)
     valid_player = [1,2]
     if valid_player.include?(first_player_to_take_turn)
      return true
     else
      puts "First Player Input: #{first_player_to_take_turn} is not valid"
      return false
    end
  end


  def start_game
    @turn = 0
    @turn2 = 0
    @turn3 = 0
    @turn4 = 0
    unless @num_of_type_of_play == 2
      puts "Welcome to my Tic Tac Toe game"
      puts "Please select your spot by typing a number from 0 to 8"
    end
    puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    
    until game_is_over(@board) || tie(@board)
      # puts "turn is #{@turn}"
      type_of_play(@num_of_type_of_play)
      @turn += 1
      puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    end
    if who_won(@board) and game_is_over(@board)
      puts "#{@player1_piece} won"
    elsif !who_won(@board) and game_is_over(@board)
      puts "#{@player2_piece} won"
      
    elsif tie(@board)
      puts "It's a tie!"
    else
      puts "Game Over"
    end
    puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
  end


  def type_of_play(number_of_type_of_play)
    if number_of_type_of_play == 1
      if @first_player_to_take_turn == 1
        if get_human_spot(player_piece = @player1_piece, opposing_player_piece = @player2_piece)
        end
        puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n" 
        if get_human_spot
        end
      else
        if get_human_spot
        end
        puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n" 
        if get_human_spot(player_piece = @player1_piece, opposing_player_piece = @player2_piece)
        end        
      end

    elsif number_of_type_of_play == 2
        if @first_player_to_take_turn == 1
          computer_ai_for_picking_spot
          computer_ai_for_picking_spot(@player2_piece,@player1_piece) 
        else 
          computer_ai_for_picking_spot(@player2_piece,@player1_piece) 
          computer_ai_for_picking_spot
        end  

    elsif number_of_type_of_play == 3
        if @first_player_to_take_turn == 1
          computer_ai_for_picking_spot(@player1_piece,@player2_piece)
          puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n" 
          if get_human_spot
          end
        else 
          if get_human_spot
          computer_ai_for_picking_spot
          end    
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
      puts "Enter a spot for #{player_piece}"
      spot = gets.chomp.to_i
        if @board[spot] != opposing_player_piece.to_s && @board[spot] != player_piece.to_s && check_valid_input(spot)
          @board[spot] = player_piece
          puts "Current Player With #{player_piece} choose #{spot}"
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
    until spot or game_is_over(@board) or  tie(@board)
      if @board[4] == "4"
        # First thing you want to do is start in the middle
        # what do you do if spot 4 is not avail?
        spot = 4
        # set spot 4 to current piece
        @board[spot] = current_player_piece
        puts "Computer with #{current_player_piece} choose spot: #{spot}"
      else

        spot = get_best_move(@board, current_player_piece,opposing_player_piece)
        if @board[spot] != current_player_piece.to_s && @board[spot] != opposing_player_piece.to_s
          @board[spot] = current_player_piece
          puts "Computer with #{current_player_piece} choose spot: #{spot}"
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board,current_player,other_player)
    available_spaces = []
    best_move = nil

    board.each do |space|
      if space != current_player.to_s && space != other_player.to_s
        # Get an array of all availabl@e_spaces
        available_spaces << space
      end
    end    

    # Offensive Moves
    unless diag_offense?(board,current_player,other_player) and best_move == nil
      best_move = offensive_mark_corner(board,available_spaces)     
    end
    puts diag_offense?(board,current_player,other_player)
    # Defensive Moves
    if diag_offense?(board,current_player,other_player) and best_move == nil
      best_move = defensive_diag_offense_counter_attack(board)
    end 

    if best_move == nil
    best_move = defensive_marked_edge?(board,board[4],other_player,current_player)
    end

    if best_move == nil
      best_move = defensive_marked_corner?(board,other_player)
    end

    if best_move != nil
      return best_move
    end 


    # puts "#{available_spaces.count} AVAIL"
    
    # Get each availspace
    available_spaces.each do |availspace|
      board[availspace.to_i] = current_player
      if !best_move.nil?
        return best_move
      # if game is over with that piece then it does that to simulate winning the game
      # Best move for my piece
    
      elsif game_is_over(board)
        best_move = availspace.to_i
        board[availspace.to_i] = availspace
        return best_move
      # if game was not over with that space is makes sure that the other player is not winning
      # Best blocking moves
      else
        board[availspace.to_i] = other_player
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
       puts "Getting a random spot"
      n = rand(0..available_spaces.count)

      return available_spaces[n].to_i


      # n = defensive_marked_edge?(board,board[4],other_player,current_player)

      # puts n
    
      # if n == nil
      #   n = defensive_marked_corner?(board,other_player)
      # end

      # return n
      # n = nil
    end
  end

  def defensive_marked_edge?(board,center_spot,opposing_player_piece,my_piece)

   if @turn2 < 1 and center_spot == my_piece
    @turn2 += 1
    # puts "Defensive Move: Marked Edge"
    if board[1] != "1" and board[6] == "6"
      return 6   
    elsif board[1] != "1" and board[8] == "8"
      return 8
    elsif board[3] != "3" and board[2] == "2"
      return 2
    elsif board[3] != "3" and board[8] == "8"
      return 8
    elsif board[5] != "5" and board[6] == "6"
      return 6
    elsif board[5] != "5" and board[0] == "0"
      return 0
    elsif board[7] != "7" and board[0] == "0"
      return 0
    elsif board[7] != "7" and board[2] == "2"
      return 2
    else 
      return nil
    end

   end 
  end

  def defensive_marked_corner?(board,opposing_player_piece)
    if @turn3 < 1
    # puts "Defensive Move: Marked Corner!"
      @turn3 += 1
      if board[0] == opposing_player_piece and board[8] == "8"
        return 8
      elsif board[2] == opposing_player_piece and board[6] == "6"
        return 6
      elsif board[6] == opposing_player_piece and board[2] == "2"
        return 2
      elsif board[8] == opposing_player_piece and board[0] == "0"
        return 0
      else 
        return nil
      end
    end
  end

  def defensive_diag_offense_counter_attack(board)
    if @turn4 < 1
      @turn4 += 1
      if board[1] == "1"
        return 1
      elsif board[3] == "3"
        return 3
      elsif board[5] == "5"
        return 5
      elsif board[7] == "7"
        return 7
      else 
        return nil
      end
    else
      return nil
    end
  end 

  def offensive_mark_corner(board,how_many_spaces)
    if board[4] != "4" and (how_many_spaces.count == 8 or how_many_spaces.count == 6)
       puts "Offensive Move: Marking Corner"
      if board[0] == "0"
        puts "0 "
        return 0
   
      elsif board[2] == "2"
        return 2
   
      elsif board[6] == "6"
        return 6
   
      elsif board[8] == "8"
        return 8
      else 
        return nil
      end
    end
  end

  def diag_offense?(board,current_player,opposing_player_piece)
    if (board[0] ==  opposing_player_piece.to_s and board[4] == current_player.to_s and board[8] == opposing_player_piece.to_s)
      return true
    elsif (board[6] ==  opposing_player_piece.to_s and board[4] == current_player.to_s and board[2] == opposing_player_piece.to_s)
      return true
    else
      return false
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

  def who_won(b)
    [b[0], b[1], b[2]].uniq == [@player1_piece] ||
    [b[3], b[4], b[5]].uniq == [@player1_piece] ||
    [b[6], b[7], b[8]].uniq == [@player1_piece] ||
    [b[0], b[3], b[6]].uniq == [@player1_piece] ||
    [b[1], b[4], b[7]].uniq == [@player1_piece] ||
    [b[2], b[5], b[8]].uniq == [@player1_piece] ||
    [b[0], b[4], b[8]].uniq == [@player1_piece] ||
    [b[2], b[4], b[6]].uniq == [@player1_piece]
  end

  def tie(b)
    b.all? { |s| s == @player1_piece.to_s || s == @player2_piece.to_s }
  end

end

game = Game.new
game.start_game
