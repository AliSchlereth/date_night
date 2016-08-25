require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/link.rb'
require_relative '../lib/node.rb'

class LinkTest < MiniTest::Test

  def test_link_takes_data_from_node
    old_node = Node.new(24, "I'm a node")
    new_node = Node.new(20, "I'm less than")
    link = Link.new(new_node, old_node)

    assert_equal 24, link.old_node_score
    assert_equal 20, link.new_node_score
  end

  def test_it_can_sort
    old_node = Node.new(24, "I'm a node")
    new_node = Node.new(20, "I'm less than")
    link = Link.new(new_node, old_node)

    assert_equal new_node, link.sorter(24, 20)
  end

  def test_link_can_link_left
    old_node = Node.new(24, "I'm a node")
    new_node = Node.new(20, "I'm less than")
    link = Link.new(new_node, old_node)

    assert_equal new_node, link.old_node.left_link
  end

  def test_link_assigns_the_value_of_new_node_to_old_node_link_left
    old_node = Node.new(61, "Bill & Ted's Excellent Adventure")
    new_node = Node.new(16, "Johnny English")
    link = Link.new(new_node, old_node)
    assert_equal new_node, link.old_node.left_link
  end

  def test_link_can_link_left_and_left_again
    old_node_2 = Node.new(50, "I'm a head node")
    new_node_2 = Node.new(45, "I'm a head's left link")
    new_new_node_2 = Node.new(40, "I'm a head's left link's left link")
    link = Link.new(new_node_2, old_node_2)
    link2 = Link.new(new_new_node_2, new_node_2)

    assert_equal new_new_node_2, link.old_node.left_link.left_link
  end

  def test_link_can_link_right
    old_node = Node.new(20, "I'm a node")
    new_node = Node.new(24, "I'm less than")
    link = Link.new(new_node, old_node)
    assert_equal new_node, link.old_node.right_link
  end

  def test_link_assigns_the_value_of_new_node_to_old_node_link_right
    old_node = Node.new(16, "Johnny English")
    new_node = Node.new(61, "Bill & Ted's Excellent Adventure")
    link = Link.new(new_node, old_node)
    assert_equal new_node, link.old_node.right_link
  end

  def test_link_can_link_right_and_right_again
    old_node_2 = Node.new(40, "I'm a head node")
    new_node_2 = Node.new(45, "I'm a head's right link")
    new_new_node_2 = Node.new(50, "I'm a head's right link's right link")
    link = Link.new(new_node_2, old_node_2)
    link2 = Link.new(new_new_node_2, new_node_2)

    assert_equal new_new_node_2, link.old_node.right_link.right_link
  end

  def test_link_secures_four_entries_to_the_left_and_right
    node1 = Node.new(61, "Bill & Ted's Excellent Adventure")
    node2 = Node.new(16, "Johnny English")
    node3 = Node.new(92, "Sharknado 3")
    node4 = Node.new(50, "Hannibal Buress: Animal Furnace")
    link = Link.new(node2, node1)
    # binding.pry
    link2 = Link.new(node3, node1)
    # binding.pry
    assert_equal node2, link.old_node.left_link

    assert_equal node3, link2.old_node.right_link

    link3 = Link.new(node4, node1)
    assert_equal node4, link3.old_node.left_link.right_link
  end

  # def test_link_uses_scores_to_decide_if_a_node_will_be_linked_to_the_left_or_right
  #   skip
  #   old_node = Node.new(61, "Bill & Ted's Excellent Adventure")
  #   new_node = Node.new(16, "Johnny English")
  #   link = Link.new(new_node, old_node)
  #   link.sorter(16, 61)
  #   assert_equal new_node, link.left_link
  # end




end
