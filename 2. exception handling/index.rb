begin
  1/0
rescue ZeroDivisionError => e
  puts e.message
  puts e.backtrace
  puts e.class.name
end
