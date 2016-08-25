require_relative 'node'

class BinarySearchTree

  attr_reader :head, :sorted

  def initialize
    @head = nil
    @node_total = 0
  end

  def insert(score, title)
    node = Node.new(score,title)
    if !@head
      @head = node
      @node_total += 1
      depth = 0
    else
      @node_total += 1
      @head.next_node(node)
    end
  end

  def include?(check_score, node = @head)
    if node == nil
      false
    elsif node.score == check_score
      true
    elsif check_score < node.score
      include?(check_score, node.left_link)
    elsif check_score > node.score
      include?(check_score, node.right_link)
    end
  end

  def depth_of(check_score, node = @head, depth = 0)
    if node == nil
      nil
    elsif check_score == node.score
      depth
    elsif check_score < node.score
      depth +=1
      depth_of(check_score, node.left_link, depth)
    elsif check_score > node.score
      depth +=1
      depth_of(check_score, node.right_link, depth)
    end
  end

  def max
    node = @head
    until node.right_link == nil
      node = node.right_link
    end
    hash = Hash[node.title, node.score]
    hash
  end

  def min
    node = @head
    until node.left_link == nil
      node = node.left_link
    end
    movie_hash = Hash[node.title, node.score]
    movie_hash
  end

  def sort(node = @head)
    sorted = []
    traverse_and_insert(node, sorted)
    sorted
  end

  def traverse_and_insert(node,sorted)
    return if !node
    traverse_and_insert(node.left_link, sorted)
    sorted << Hash[node.title , node.score]
    traverse_and_insert(node.right_link, sorted)
  end

  def load(input_file)
    movie_count = 0
    IO.foreach(input_file) do |movie|
      movie = movie.chop.split(",")
      insert(movie[0].to_i, movie[-1])
      movie_count +=1
    end
    movie_count
  end

  def health(input_depth, node = @head)
    sorted = []
    if input_depth != 0
      sorted_array = sort_by_depth(node, sorted, input_depth)
    else
      sorted_array = []
       sorted_array << node
    end
      sorted_array.map do |node|
      node_children_total = sort(node).length
      percent = (node_children_total/@node_total.to_f * 100).to_i
      [node.score, node_children_total, percent]
    end
  end

  def sort_by_depth(node, sorted, input_depth)
    return if !node
    sort_by_depth(node.left_link, sorted, input_depth)
    sorted << node if depth_of(node.score) == input_depth
    sort_by_depth(node.right_link, sorted, input_depth)
    sorted
  end

end
