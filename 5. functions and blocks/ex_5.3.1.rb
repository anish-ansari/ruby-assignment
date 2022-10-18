def email_parts(email)
  username = email.match(/(?<username>\w+(?=@))/i)[0]
  domain = email.match(/(?<domain>(?<=@)\S+)/i)[0]
  arr = []
  arr.push(username.downcase, domain.downcase)
  puts arr.inspect
end

print "Enter your email address: "
email = gets.chomp
email_parts(email)
