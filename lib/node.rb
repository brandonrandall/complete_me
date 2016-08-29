class Node

attr_accessor :end_of_word, :letters

  def initialize
    @end_of_word = false
    @letters = {}
    @partial = nil
  end

end
