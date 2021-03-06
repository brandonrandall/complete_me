require_relative 'node'
require 'pry'
class CompleteMe

  attr_accessor :root, :count, :weighted_value

  def initialize
    @root = Node.new
    @weighted_value = {}
    @count = 0
    @ending = []
    @result = []
  end

  def insert(word)
    populate_dictionary(word.chars)
  end

  def input(input)
    starting_node = traverse(input.chars)
    results = grab_suggestions(starting_node, input)
    @result
  end

  def suggest(prefix)
    words = @weighted_value[prefix]
    words = words.sort_by do |key, value|
      value
    end
    ordered_words = words.reverse
    sorted_words = ordered_words.map do |obj|
      obj[0]
    end
    final_product = sorted_words.flatten
    # binding.pry
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
    @result << prefix + @ending.join unless @ending.empty?
    @ending = []
  end

  def select(prefix, selection)
    @weighted_value[prefix] ||= {}
    @weighted_value[prefix][selection] ||= 0
    @weighted_value[prefix][selection] += 1
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
