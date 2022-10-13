x = "foo"
y = ""
puts x && y
puts !!(x && y)
puts x || y

if x.empty? || y.empty?
  puts("At lease one of the string is nonempty")
else
  puts("Both strings are empty")
end
