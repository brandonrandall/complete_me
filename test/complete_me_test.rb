require 'simplecov'
SimpleCov.start
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
    skip
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)

    assert_equal 235886, completion.count
  end

  def test_tree_can_make_suggestions_after_being_populated
    skip
    completion = CompleteMe.new
    dictionary = File.read("/usr/share/dict/words")
    completion.populate(dictionary)
    completion.insert("pizza")

    assert_equal ["pizza", "pizzeria", "pizzicato", "pizzle"], completion.input("pizz")
  end

  def test_tree_can_take_input_prefix
    # skip
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")
    assert_equal ["pizza", "pizzeria"], completion.input("pizz")
  end

  def test_it_makes_selectiions
    # skip
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")
    completion.select("pizz", "pizza")
    completion.select("pizz", "pizza")
    completion.select("pizz", "pizzeria")

    assert_equal ({"pizz"=>{"pizza"=>2, "pizzeria"=>1}}), completion.weighted_value

  end

  def test_it_tree_makes_weighted_suggestions
    completion = CompleteMe.new
    completion.insert("pizza")
    completion.insert("pizzeria")
    completion.select("pizz", "pizza")
    completion.select("pizz", "pizzeria")
    completion.select("pizz", "pizzeria")
    result = completion.suggest( "pizz" )
    assert_equal ["pizzeria","pizza"], result
  end
end
