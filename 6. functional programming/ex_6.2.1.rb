states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

def usingIncludes(string)
  string.select { |s| s.include? "Dakota" }
end

p usingIncludes(states)

def usingLength(string)
  string.select { |s| s.split.length == 2 }
end

p usingLength(states)

