# turning states into https://example.com/<urlifiedform>
states = ["Kansas", "Nebraska", "North Dakota", "South Dakota"]

# Returns a URL-friendly version of a string.
# Example: "North Dakota" -> "north-dakota"
def urlify(string)
  string.downcase.split.join("-")
end

def functional_urls(states)
  states.map { |state| urlify(state) }.map { |url| "https://example.com/#{url}" }
end

p functional_urls(states)
