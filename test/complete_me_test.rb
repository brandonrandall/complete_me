require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/complete_me'

class CompleteMeTest < Minitest::Test

  # def test_it_returns_a_word_when_inserted
  #   completion = CompleteMe.new
  #   insertion = completion.insert("pizza")
  #   insertion = completion.insert("pasta")
  #   insertion = completion.insert("apple")
  #   # binding.pry
  #   assert_equal "pizza", insertion
  # end

  def test_it_inserts_the_word_pizza

    completion = CompleteMe.new
    assert_equal 0, completion.count
    completion.insert("pizza")
    assert_equal 1, completion.count
  end

  def test_tree_can_make_suggestions
    # skip
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")
    assert_equal ["pizza", "pizz eria"], completion.suggest("pizz")

  end


end










  # def test_node_has_suggestions
  #   completion = CompleteMe.new
  #   node = CompleteMeNode.new("piz")
  #   insertion = completion.insert("piz")
  #   assert_equal "pizza", node.
  # end