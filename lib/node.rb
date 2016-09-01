class Node

attr_accessor :end_of_word, :letters

  def initialize
    @end_of_word = false
    @letters = {}
    @partial = nil
    @word_count = 0
    # @input =
  end



end

# pizza_shack = ({ :pizz => {"pizza" => 1}})
# p pizza_shack[:pizz]
# { "pizz" => {"pizza" => 1}}
# pets.key("Dusty")
# => :Jon
#
