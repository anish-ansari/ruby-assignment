# simple module
module Greetings
  def hello(name)
    puts ("Hello, " + name)
  end

  def goodbye(name)
    puts ("Goodbye, " + name)
  end
end

include Greetings

Greetings.hello("Anish")
Greetings.goodbye("Anish")

# module constants
module Hello
  module Goodbye
    CONST = "Ansari"
  end

  module Bye
    CONST = "Anish"
  end
end

include Hello

puts Hello::Goodbye::CONST
puts Hello::Bye::CONST
