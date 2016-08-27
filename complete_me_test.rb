require_relative 'complete_me_node'
require_relative 'complete_me'
require 'minitest/autorun'
require 'minitest/pride'

class CompleteMeTest < Minitest::Test

  def test_it_returns_a_word_when_inserted

    completion = CompleteMe.new
    insertion = completion.insert("pizza")
    assert_equal "pizza", insertion
  end

  def test_it_inserts_the_word_pizza
    completion = CompleteMe.new
    assert_equal 0, completion.count
    completion.insert("pizza")
    assert_equal 1, completion.count
  end

  def test_tree_can_insert_nodes
    completion = CompleteMe.new
    tree = CompleteMe.new
    completion.insert("piz")
    assert_equal ["pizza"], completion.suggest("piz")

  end
end










  # def test_node_has_suggestions
  #   completion = CompleteMe.new
  #   node = CompleteMeNode.new("piz")
  #   insertion = completion.insert("piz")
  #   assert_equal "pizza", node.
  # end
