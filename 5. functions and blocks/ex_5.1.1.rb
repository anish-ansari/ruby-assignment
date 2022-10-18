def square(num)
  num.match(/\./) ? num.to_f ** 2 : num.to_i ** 2
end

print "Enter a number: "
number = gets.chomp
sq = square(number)
puts "Square of #{number}: #{sq}"
