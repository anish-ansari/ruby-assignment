def sandwich
  puts "top bread"
  yield # yielding a block
  # its like adding a block in place of yield
  puts "bottom bread"
end

sandwich do
  puts "mutton, lettuce, tomato"
end


def tag(tagname, text)
  html = "<#{tagname}>#{text}</#{tagname}"
  yield html # passing html variable into the block
end

# Wrap some text in a paragraph tag.
tag("p", "Lorem ipsum dolor sit amet, consectet") do |markup| #here markup parameter accepts html variable as argument
  puts markup
end


# a regular function can’t replicate the behavior achieved with a block?
def bad_sandwich(contents)
  puts "top bread"
  contents
  puts "bottom bread"
end

bad_sandwich(puts "mutton, lettuce, and tomato")


def hello
  yield
end

hello do
  p "Hello"
end

hello do
  p "Bye"
end

hello


def explicit_block(&block)
  block.call # same as yield
end

explicit_block { puts "Explicit block called" }
