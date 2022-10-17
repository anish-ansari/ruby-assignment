user = {
  username: "admin",
  password: "1234567890",
  password_confirmation: "1234567890",
}

puts (user[:password] == user[:password_confirmation]) ? "Password confirmed successfully" : "Password not confirmed"
