require 'mysql2'

class Database
  def db_connection
    host = 'localhost'
    db = 'expense_tracker'
    user = 'anish'
    pass = ''

    # accessing the database via mysql2 gem
    conn = Mysql2::Client.new(
      host: host,
      username: user,
      database: db,
      password: pass
    )
    @conn = conn
  end
end
