require_relative 'node'

class CompleteMe

  attr_accessor :root, :count

  def initialize
    @root = Node.new
    @count = 0
    @ending = []
    @result = []
  end

  def insert(word)
    populate(word.chars)
  end


  def suggest(input)
    starting_node = traverse(input.chars)

    a = grab_suggestions(starting_node, input)
  end

  private

  def grab_suggestions(starting_node, prefix)
    starting_node.letters.each do |letter, node|
      @ending << letter
      grab_suggestions(node, prefix)
    end
    @result << @ending.join
    @ending = []
    binding.pry
  end

  def populate(array_of_letters, current_node = @root, index = 0)
    current_letter = array_of_letters[index]
    if current_letter.nil?
      current_node.end_of_word = true
      @count += 1
    elsif current_node.letters[current_letter].nil?
      current_node.letters[current_letter] = Node.new
      index += 1
      current_node = current_node.letters[current_letter]
      populate(array_of_letters, current_node, index)
      # populate(array_of_letters, new_node, index += 1)
    else
      index += 1
      current_node = current_node.letters[current_letter]
      populate(array_of_letters, current_node, index)
    end
  end


  def traverse(letter_array, current_node = @root, index = 0)
    current_letter = letter_array[index]

    if letter_array.length == index
      current_node
    else
      index += 1
      current_node = current_node.letters[current_letter]
      traverse(letter_array, current_node, index)
    end
  end
end
