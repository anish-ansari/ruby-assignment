# Should work
my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"
# Should raise exception
my_proc = Proc.new { return 1 }
puts "Proc result: #{my_proc.call}"

def call_proc
  puts "Before proc"
  my_proc = Proc.new { return 2 }
  my_proc.call
  puts "After proc"
  p "hello"
end

p call_proc
# Prints "Before proc" but not "After proc"
