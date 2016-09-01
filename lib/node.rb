class Node

attr_accessor :end_of_word, :letters

  def initialize
    @end_of_word = false
    @letters = {}
    @partial = nil
    @word_count = 0
  end
end
