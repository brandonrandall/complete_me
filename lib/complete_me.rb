require_relative 'node'
# require 'pry'
class CompleteMe

  attr_accessor :root, :count, :frequency_of_selection, :default_weighted_value

  def initialize
    @root = Node.new
    @default_weighted_value = {} # Hash.new { Hash.new(0) }
    @count = 0
    @ending = []
    @result = []
  end

  def insert(word)
    populate_dictionary(word.chars)
  end

  def input(input)
    starting_node = traverse(input.chars)
    # binding.pry
    results = grab_suggestions(starting_node, input)
    # format_suggestions(results, input)
    @result
  end

  def suggest(prefix)
    words = @default_weighted_value[prefix]
    words = words.sort_by do |key, value|
      value
    end
    ordered_words = words.reverse
    sorted_words = ordered_words.map do |obj| 
      obj[0]
    end
    final_product = sorted_words.flatten
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
#
  def select(prefix, selection)
    @default_weighted_value[prefix] ||= {}
    @default_weighted_value[prefix][selection] ||= 0
    @default_weighted_value[prefix][selection] += 1
    # @default_weighted_value[prefix] = {selection => }
# binding.pry
    # @hash[prefix][selection] += 1
    #
  end

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
    # binding.pry

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
