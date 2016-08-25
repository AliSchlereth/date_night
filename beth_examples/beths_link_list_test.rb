require 'minitest/autorun'
require 'minitest/pride'
require_relative 'beths_link_list_example'
require_relative 'beths_node_example'

class LinkedListTest < Minitest::Test

  def test_a_list_is_created_with_a_node
    list = LinkedList.new("Notorious RBG")

    assert_equal Node, list.head.class
    assert_equal "Notorious RBG", list.head.data
  end
