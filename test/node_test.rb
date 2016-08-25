require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

class NodeTest < MiniTest::Test

  def test_node_requires_a_score_and_title
    node = Node.new(50,"I'm a node!")
    assert_equal "I'm a node!", node.title
    assert_equal 50, node.score
  end

  def test_node_starts_with_no_link
    node = Node.new(50, "I've got nothing.")
    assert_equal nil, node.left_link
    assert_equal nil, node.right_link
  end

  # def test_node_calls_up_an_instance_of_link
  #   node = Node.new(61, "Bill and Ted's Excellent Adventure")
  #   node_to_link_on = Node.new(16, "Johnny English")
  #   node.next_node(node_to_link_on)
  #   assert_equal 16, node.link
  # end


end
