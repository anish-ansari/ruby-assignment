require File.expand_path('db.rb', __dir__)

class ExpenseTracker < Database
  def display_menu
    puts "            Welcome to Your Expense Tracker\n"
    current_date = Time.now.strftime('%A, %b %d %Y')
    puts "            Today is #{current_date}"
    puts "\nWhat do you want to do today?"
    puts '1. Add new expense'
    puts '2. View your expenses'
    puts '3. Modify your expense'
    puts '4. Delete your expense'
    puts '5. Exit'
    print "\nEnter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      create_expense
    when 2
      read_expense
    when 3
      update_expense
    when 4
      delete_expense
    when 5
      # closing db connection when exiting
      conn.close if @conn
      puts 'Exiting...'
      sleep 1
      exit
    else
      puts 'Wrong choice entered. Please try again'
      sleep 1
      system('clear')
      display_menu
    end
  end

  def create_expense
    system('clear')
    current_date = Time.now.strftime('%Y-%m-%d')
    print 'Enter the amount you spent: '
    amount = gets.chomp.to_i
    print "\nWhat did you spend it on? "
    description = gets.chomp

    insert_expense = db_connection.prepare "INSERT INTO Expense (Id, Date, Amount, Description)
                                            VALUES (?, ?, ?, ?)"
    insert_expense.execute nil, current_date, amount, description
    puts 'Expense added successfully'
    sleep 1
    display_menu
  end

  def read_expense
    system('clear')
    puts "1. View today's expenses"
    puts '2. View expense of specfic date'
    puts '3. Go back to main menu'
    print "\nEnter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
      system('clear')
      current_date = Time.now.strftime('%Y-%m-%d')
      current_good_date = Time.now.strftime('%A, %b %d %Y')
      display_expense(current_date, current_good_date)
    when 2
      system('clear')
      begin
        print 'Enter the date you want to look up [YYYY-MM-DD]: '
        date = gets.chomp
        arr = date.split('-')
        new_date = Time.new(arr[0].to_i, arr[1].to_i, arr[2].to_i).strftime('%A, %b %d %Y')
        display_expense(date, new_date)
      rescue ArgumentError
        puts 'Wrong text entered. Please try again'
        retry
      end
    when 3
      display_menu
    else
      puts 'Wrong choice entered. Please try again'
      sleep 1
      system('clear')
      read_expense
    end
    @indexing
  end

  # helper function to display data
  def display_expense(date, formatted_date)
    @data = db_connection.query("SELECT * FROM Expense WHERE Date = '#{date}'")
    # how many dates are there:
    @count = db_connection.query("SELECT COUNT(*) FROM Expense WHERE Date = '#{date}'")

    puts "Expense of #{formatted_date} is as follows:"

    @real_count = 0
    @count.each do |c|
      @real_count = c['COUNT(*)'] # now real_count is THE real count
    end

    puts "\nID      |       Amount     |    Spent on" # 4 tabs
    puts '________|__________________|__________________'
    total = 0
    i = 1

    # oh yea, it's big brain time
    @indexing = {}
    @data.each do |d|
      # so assigning table's id to serial order of value of i, then putting them as key value pair in a hash
      @indexing[i] = d['ID']
      i += 1
    end

    i = 1
    @data.each do |d|
      total += d['Amount']
      puts "#{i}       |         #{d['Amount']}        |   #{d['Description']}"
      i += 1
    end
    puts '________|__________________|__________________'
    puts "               Total = #{total}"

    @indexing
  end

  def update_expense
    @indexing = read_expense
    print 'Enter the ID of the expense you want to edit: '
    delete_id = gets.chomp.to_i

    if @indexing.key? delete_id
      update_id = @indexing[delete_id]
      print 'Enter new amount: '
      new_amount = gets.chomp.to_i
      print 'Enter new description: '
      new_descp = gets.chomp

      change_expense = db_connection.prepare 'UPDATE Expense
                                              SET Amount = ?, Description = ?
                                              WHERE ID = ?'
      change_expense.execute new_amount, new_descp, update_id
      puts 'Update success'
    else
      puts 'ID does not exist'
    end
  end

  def delete_expense
    @indexing = read_expense
    print 'Enter the ID of the expense you want to delete: '
    delete_id = gets.chomp.to_i

    if @indexing.key? delete_id
      actual_id = @indexing[delete_id]

      remove_expense = db_connection.prepare 'DELETE FROM Expense WHERE ID = ?'
      remove_expense.execute actual_id
      puts 'Delete success'

      # removing the key value pair, for the ID that has been deleted
      # this is a just in case
      @indexing.delete_if { |_, v| v == actual_id }
    else
      puts 'ID does not exist'
    end
  end

  obj = ExpenseTracker.new
  obj.display_menu
end
