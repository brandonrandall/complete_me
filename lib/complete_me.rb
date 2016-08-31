require_relative 'node'

class CompleteMe

  attr_accessor :root, :count, :frequency_of_selection

  def initialize
    @root = Node.new
    @count = 0
    @ending = []
    @result = []
    @frequency_of_selection = 0
  end

  def insert(word)
    populate_dictionary(word.chars)
  end

  def suggest(input)
    starting_node = traverse(input.chars)
    results = grab_suggestions(starting_node, input)
    # format_suggestions(results, input)
    @result
  end

  def format_suggestions(results, input)
    a = results.map { |result| "#{input}#{result}" }.uniq
  end

  def populate(dictionary)
    split_dictionary = dictionary.split("\n").uniq
    split_dictionary.each do |word|
      insert(word)
    end
  end


  def grab_suggestions(starting_node, prefix)
    starting_node.letters.each do |letter, node|
      @ending << letter
      grab_suggestions(node, prefix)
    end
    # @result << @ending.join
    @result << prefix + @ending.join unless @ending.empty?
    @ending = []
  end

  # def select(prefix, selection)
  #   # need to count the frequency of the times the same thing is input
  #   # if word is the same as what is in the array then count it
  #   # if a word is selected from the dictionary then write it to a sep file
  #   @frequency = []
  #   # if word is put in the frequency array then count that word
  #   @frequency_of_selection += 1
  #   {prefix => {selection => frequency}}
  #
  # end

  def populate_dictionary(array_of_letters, current_node = @root, index = 0)
    current_letter = array_of_letters[index]
    if current_letter.nil?
      current_node.end_of_word = true
      @count += 1
    elsif current_node.letters[current_letter].nil?
      current_node.letters[current_letter] = Node.new
      index += 1
      current_node = current_node.letters[current_letter]
      populate_dictionary(array_of_letters, current_node, index)
      # populate_dictionary(array_of_letters, new_node, index += 1)
    else
      index += 1
      current_node = current_node.letters[current_letter]
      populate_dictionary(array_of_letters, current_node, index)
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

  def make_suggestions
    @ending
  end
end
