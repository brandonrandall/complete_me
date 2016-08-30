require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_new_node_begins_with_end_of_word_flag_as_false
    node = Node.new
    assert_equal false, node.end_of_word
  end

  def test_new_node_begins_with_empty_letters_hash
    node = Node.new
    assert_equal ({}), node.letters
  end

end
