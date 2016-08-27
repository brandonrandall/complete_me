require_relative 'complete_me_node'
require_relative 'complete_me'
require 'minitest/autorun'
require 'minitest/pride'

class CompleteMeTest < Minitest::Test

  def test_node_exists
    node = CompleteMeNode.new
    assert_instance_of CompleteMeNode, node
  end

  def test_node_has_left_right_and_input
    
  end

end
