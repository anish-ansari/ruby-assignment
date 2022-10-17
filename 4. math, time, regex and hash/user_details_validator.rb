# getting email from user
def get_email()
  print "Enter your email address: "
  text = gets
  text = text.chomp # removing \n from the email
  return text
end

# checking email validity
def email_validity(email)
  # first regex is to check if the email is in lower case
  # second regex is to check if the email contains @ and .
  if (email.match(/([[:lower:]]+)/)) && (email.match(/\W/))
    index1 = (email.scan(/(\W){1}/)[0]).join("") # extracting @ from the email
    index2 = (email.scan(/(\W){1}/)[1]).join("") # extracting . from the email

    # checking if @ comes before .
    if (index1 == "@") && (index2 == ".")
      puts "Valid email address"
    else
      puts "Invalid email address"
      puts "Please enter a valid email address"
      sleep 2
      system("clear")
      get_email()
      new_email = get_email()
      email_validity(new_email)
    end
  else
    puts "Invalid email address"
    puts "Please enter a valid email address"
    sleep 2
    system("clear")
    new_email = get_email()
    email_validity(new_email)
  end
end

def main()
  email = get_email()
  email_validity(email)
end

main()
