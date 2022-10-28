require "./main_menu" # importing main menu function

# generates the game board
def generate_board(pos)
  system("clear")
  puts "           #{pos[0]}  |     #{pos[1]}  |     #{pos[2]}
      ________|________|_________
           #{pos[3]}  |     #{pos[4]}  |     #{pos[5]}                     Player 1\: O
      ________|________|_________
           #{pos[6]}  |     #{pos[7]}  |     #{pos[8]}                     Player 2\: X
              |        |"
  puts "Note: Enter e to exit at any time"
end

# to check all possible win states for O
def o_win(pos)
  # horizontal win
  return 1 if (pos[0] == "O" && pos[1] == "O" && pos[2] == "O") ||
              (pos[3] == "O" && pos[4] == "O" && pos[5] == "O") ||
              (pos[6] == "O" && pos[7] == "O" && pos[8] == "O")

  # vertical win
  return 1 if (pos[0] == "O" && pos[3] == "O" && pos[6] == "O") ||
              (pos[1] == "O" && pos[4] == "O" && pos[7] == "O") ||
              (pos[2] == "O" && pos[5] == "O" && pos[8] == "O")

  # left diagonal win
  return 1 if (pos[0] == "O" && pos[4] == "O" && pos[8] == "O")

  # right diagonal win
  return 1 if (pos[2] == "O" && pos[4] == "O" && pos[6] == "O")
end

# to check all possible win states for X
def x_win(pos)
  # horizontal win
  return 1 if (pos[0] == "X" && pos[1] == "X" && pos[2] == "X") ||
              (pos[3] == "X" && pos[4] == "X" && pos[5] == "X") ||
              (pos[6] == "X" && pos[7] == "X" && pos[8] == "X")

  # vertical win
  return 1 if (pos[0] == "X" && pos[3] == "X" && pos[6] == "X") ||
              (pos[1] == "X" && pos[4] == "X" && pos[7] == "X") ||
              (pos[2] == "X" && pos[5] == "X" && pos[8] == "X")

  # left diagonal win
  return 1 if (pos[0] == "X" && pos[4] == "X" && pos[8] == "X")

  # right diagonal win
  return 1 if (pos[2] == "X" && pos[4] == "X" && pos[6] == "X")
end

# main function
def main
  choice = main_menu
  owin = 0
  xwin = 0

  # similar to switch...case
  case choice
  when 1
    pos = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    begin
      count = 0
      while count < 10
        generate_board(pos)
        puts "\nPlayer 1's turn"
        print "Enter O in which position?: "
        temp = gets.chomp
        if temp == 'e'
          puts "Exiting..."
          sleep 1
          exit
        end
        index = pos.index(temp)
        pos[index].replace("O")

        generate_board(pos)
        owin = o_win(pos)
        break if owin == 1

        break if count == 8

        puts "\nPlayer 2's turn"
        print "Enter X in which position?: "
        temp = gets.chomp
        index = pos.index(temp)
        pos[index].replace("X")

        generate_board(pos)
        xwin = x_win(pos)
        break if xwin == 1

        count += 2
      end
    rescue TypeError => exception
      puts "Wrong choice entered."
      puts "Try again"
      sleep(2)
      system("clear")
      retry
    end
  when 2
    puts "Exiting..."
    sleep(1)
    exit
  else
    puts "Wrong choice, enter again"
  end

  if owin == 1
    puts "Player 1 wins"
  elsif xwin == 1
    puts "Player 2 wins"
  else
    puts "Drawn!"
  end
end

main
