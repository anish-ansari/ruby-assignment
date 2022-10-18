# Returns true for palindrome, otherwise false.
def palindrome?(string)
  processed_content = string.downcase
  processed_content == processed_content.reverse
end
