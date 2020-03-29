# The condition of the board
class Board 

    # Instance variables
    def initialize(board)
        @board = board
    end
    
    # Give the condition of the board to other classes
    def get_board
        return @board
    end 
    
    # Show how the board looks like
    def show
        @board.each{|column|
            p column
        }
     end
end


# How each player place his/her sign on the board
class Player
    
    # Instance variables
    def initialize(board, char)
        @board = Board.new(board)
        @char = char
    end 
       
    # Get info about whether one particular grid is empty or not
    def is_empty
     
        p "At which grid would you like to place your sign?"
        p "Please write down the number of column, then that of row"
        p "For example, if you wanna fill the grid on the column 1 and row 2, write 1-2"
        choice = gets
        column = choice[0].to_i
        row = choice[2].to_i
        
        # The case when you choose a non-existed grid 
        if column < 1 or column > 3 or row < 1 or row > 3 then
        
            p "There is no such grid on the board."
            return false
        
        # The case when the chosen grid is already filled
        elsif @board.get_board[column][row] != " " then
    
            p "This grid is already filled. Please choose another one."
            return false
        
        # Put a sign into an empty grid
        else
        
            @board.get_board[column][row] = @char
            return true
            
        end
        
    end
    
    # A single tern for a player
    def enter_char
    
        cell_is_empty = false
        
        begin
        
            cell_is_empty = self.is_empty
            
        end while cell_is_empty == false
        
        p "This is how the board looks like right now."
        @board.show
        
    end
    
end


# The whole game
class Game

    # Instance variables
    def initialize(board, mark1, mark2)
        
        @board = board
        @Board = Board.new(board)
        @mark1 = mark1
        @mark2 = mark2
        @player1 = Player.new(@board,@mark1)
        @player2 = Player.new(@board,@mark2)
        
        @Board.show
     
    end   
      
    #  The main function of the game
    def play
    
        loop do 
            
            # Player 1's turn
            p "Player 1's turn"
            @player1.enter_char
            
            # See whether the game is done or not & who won the game
            done, pattern = self.is_done
            winner = self.who_won
            
            if done == true and winner == "Neither of them" then
            
                p "This game is even"
                break
                
            elsif done == true then
                
                p "#{winner} won this game"
                break
                
            end
        
            # Player 2's turn
            p"Player 2's turn"
            @player2.enter_char 
            
            # See whether the game is done or not & who won the game
            done, pattern = self.is_done
            winner = self.who_won
            
            if done == true and winner == "Neither of them" then
            
                p "This game is even"
                break
                
            elsif done == true then
                
                p "#{winner} won this game"
                break
                
            end
        end
        
    end
        
    
    # See if the game is finished or not 
    def is_done
    
        patterns = [[@board[1][1], @board[1][2], @board[1][3]],
                    [@board[2][1], @board[2][2], @board[2][3]],
                    [@board[3][1], @board[3][2], @board[3][3]],
                    [@board[1][1], @board[2][1], @board[3][1]],
                    [@board[1][2], @board[2][2], @board[3][2]],
                    [@board[1][3], @board[2][3], @board[3][3]],
                    [@board[1][1], @board[2][2], @board[3][3]],
                    [@board[3][1], @board[2][2], @board[1][3]]]
                     
        done = false
        which_pattern = [0]
        
        # When one player wins the game
        
        patterns.each do |pattern|
         
            if pattern[0] != " " and pattern[0] == pattern[1] and pattern[1] == pattern[2] then 
              
                # The game is done
                
                done = true
                
                # This is which pattern that the game finishes
                
                which_pattern = pattern
                
                break
                
            end

        end
        
        # When the game is even (All the grids are filled)
        
        # Count the number of filled grids
        num_filled_grids = 0
        
        for i in 1 ... @board.size do
        
            for j in 1 ... @board[0].size do
            
                if @board[i][j] != " "
                
                    num_filled_grids += 1
                    
                end
                
            end
            
        end
        
        # If all the grids are filled
        if num_filled_grids == 9
        
            # The game is also done
            done = true
            
        end
        
        return done, which_pattern
        
    end
    
    
    # Let's see who won the game
    def who_won
        
        winner = "Neither of them"
        
        done, pattern = self.is_done
        
        # When the player 1 won the game
        if pattern[0] == @mark1 then
            
            winner = "Player 1"
        
        # When the player2 won the game
        elsif pattern[0] == @mark2 then
        
            winner = "Player 2"
            
        end
        
        return winner
        
    end
    
end


# Start running the code
if __FILE__ == $0
        
    board =  [[" ", "1","2","3"], 
              ["1", " "," "," "],
              ["2", " "," "," "],
              ["3", " "," "," "]]
                
    game = Game.new(board, "o", "x")
    game.play
    
end
            
            

