# a function that displays the main menu

def main_menu
  system("clear")
  puts "                    Welcome to TIC TAC TOE"
  puts "1. Play game"
  puts "2. Exit"
  print "Enter your choice: "
  choice = gets.chomp.to_i
end
