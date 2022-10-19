def multiply(array)
  array.inject(:*)
end

p multiply((1..5).to_a)

states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

def functional_lengths(states)
  states.reduce({}) { |lengths, state| lengths.merge({ state => state.length }) }
end

puts functional_lengths(states)

def urlify(string)
  string.downcase.split.join("-")
end

def using_collect(states)
  states.collect { |state| urlify(state) }
end

puts using_collect(states).inspect

def functional_lengths(states)
  states.inject({}) do |lengths, state|
    lengths[state] = state.length
    lengths
  end
end

puts functional_lengths(states)

def functional_singles(states)
  states.reject { |state| state.split.length != 1 }
end

puts functional_singles(states).inspect
