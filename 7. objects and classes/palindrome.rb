# class Phrase < String
#   # Returns content for palindrome testing.
#   def processed_content
#     self.downcase
#   end

#   # Returns true for a palindrome, false otherwise.
#   def palindrome?
#     processed_content == processed_content.reverse
#   end
# end

# palindrome using module to work on both String and Integer
module Palindrome
  # Returns true for a palindrome, false otherwise.
  def palindrome?
    processed_content == processed_content.reverse
  end

  private

  # Returns content for palindrome testing.
  def processed_content
    self.to_s.downcase
  end
end

include Palindrome

