require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/complete_me'

class CompleteMeTest < Minitest::Test

  def test_it_returns_a_word_when_inserted
    completion = CompleteMe.new
    completion.insert("pizza")

    assert_equal 1, completion.count
  end

  def test_it_returns_a_word_when_inserted
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("fries")

    assert_equal 2, completion.count
  end

  def test_it_inserts_the_word_pizza
    completion = CompleteMe.new
    assert_equal 0, completion.count
    completion.insert("pizza")
    assert_equal 1, completion.count
  end

  def test_it_populates_dictionary
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)

    assert_equal 235886, completion.count
  end

  def test_tree_can_make_suggestions_after_being_populated
    # skip
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)
    completion.insert("pizza")

    assert_equal ["pizza", "pizzeria", "pizzicato", "pizzle"], completion.suggest("pizz")
  end

  def test_tree_can_make_suggestions
    # skip
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")
    assert_equal ["pizza", "pizzeria"], completion.suggest("pizz")
  end

  # def test_tree_can_count_the_frequency_that_the_same_word_is_entered
  #   completion = CompleteMe.new
  #   completion.select("piz", "pizzeria")
  #   assert_equal 1, completion.suggest("pizz")
  #   # completion.select("piz")
  #   # assert_equal 2, completion.
  #   # completion.select("piz")
  #   # assert_equal 3, completion.
  #
  # end
end
