require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative '../lib/binary_search_tree'

class BinarySearchTreeTest <Minitest::Test

  def test_bst_creates_a_new_node_at_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.head.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.head.title
  end

  def test_bst_insert_creates_a_link_onto_existing_node
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.head.score
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.head.left_link.score
  end

  def test_bst_insert_creates_a_link_onto_existing_node_to_both_left_and_right
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.head.score
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.head.left_link.score
    tree.insert(92, "Sharknado 3")
    assert_equal 92, tree.head.right_link.score
  end

  def test_bst_insert_creates_a_link_onto_left_and_left_again
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.head.score
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.head.left_link.score
    tree.insert(12, "Mary Poppins")
    assert_equal 12, tree.head.left_link.left_link.score
  end

  def test_bst_insert_creates_a_link_onto_right_and_right_again
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.head.score
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.head.left_link.score
    tree.insert(74, "Good Will Hunting")
    assert_equal 74, tree.head.right_link.score
    tree.insert(94, "Land Before Time")
    assert_equal 94, tree.head.right_link.right_link.score
  end

  def test_bst_inserts_a_new_node
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    assert_equal 2, tree.insert(15, "Something")
  end

  def test_bst_include_checks_if_a_head_score_is_present
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert tree.include?(61)
  end

  def test_bst_include_checks_if_a_later_score_is_present
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(16)
    assert tree.include?(92)
    assert tree.include?(50)
    refute tree.include?(10)
  end

  def test_bst_depth_of_returns_the_depth_of_a_node_when_given_a_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 0, tree.depth_of(61)
    tree.insert(16, "Johnny English")
    assert_equal 1, tree.depth_of(16)
    tree.insert(92, "Sharknado 3")
    assert_equal 1, tree.depth_of(92)
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 2, tree.depth_of(50)
    assert_equal nil, tree.depth_of(10)
  end

  def test_max_recognizes_the_head_as_the_highest_score_and_returns_a_hash_when_only_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal ({"Bill & Ted's Excellent Adventure"=>61}), tree.max
  end


  def test_max_finds_the_node_with_the_highest_score_and_returns_the_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ({"Sharknado 3"=>92}), tree.max
  end

  def test_min_recognizes_the_head_as_the_lowest_score_and_returns_a_hash_when_only_head
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal ({"Bill & Ted's Excellent Adventure"=>61}), tree.min
  end

  def test_min_finds_the_node_with_the_lowest_score_and_returns_the_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ({"Johnny English"=>16}), tree.min
  end

  def test_sort_creates_an_array_of_hashes_given_one_movie
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal ([{"Bill & Ted's Excellent Adventure" => 61}]), tree.sort
  end

  def test_sort_creates_an_array_of_hashes_given_two_movies
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")

    assert_equal ([{"Johnny English"=>16},{"Bill & Ted's Excellent Adventure" => 61}, ]), tree.sort
  end

  def test_sort_creates_an_array_of_hashes_given_four_movies
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ([{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50}, {"Bill & Ted's Excellent Adventure" => 61}, {"Sharknado 3"=>92}]), tree.sort
  end

  def test_load_takes_in_a_txt_file_and_inserts_each_listing
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 6, tree.load('movies.txt')
  end

  def test_health_returns_array_of_score_number_of_children_and_percentage
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")

    assert_equal [[61, 2, 100]], tree.health(0)
  end

  def test_health_returns_array_given_multiple_inserts
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal [[61, 4, 100]], tree.health(0)
  end

  def test_health_returns_array_given_multiple_inserts
    tree = BinarySearchTree.new
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")

    assert_equal [[98, 7, 100]], tree.health(0)
    assert_equal [[58, 6, 85]], tree.health(1)
    assert_equal [[36, 2, 28], [93, 3, 42]], tree.health(2)
  end





end
