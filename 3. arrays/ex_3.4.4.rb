num = [8, 17, 42, 99]
print num.reverse
puts
print num
puts
print num.reverse!
puts
print num
puts

a = ["ant", "bat", "cat", 42]
puts a == (a.join(" ").split(" ")) ? "Same" : "Different"

arr = (0..5).to_a
print arr
puts
arr.shift
print arr
puts
arr.unshift(55)
print arr
puts
