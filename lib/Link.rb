require_relative 'node'

class Link

  attr_reader :new_node_score,
              :old_node_score,
              :old_node,
              :depth

  def initialize(new_node, old_node, depth = 1)
    @new_node = new_node
    @old_node = old_node
    @new_node_score = new_node.score
    @old_node_score = old_node.score
    @depth = depth
    sorter(new_node_score, old_node_score)
  end

  def sorter(new_node_score, old_node_score)
    link_left if new_node_score < old_node_score
    link_right if new_node_score > old_node_score
  end

  def link_left
    if @old_node.left_link == nil
      @old_node.left_link = @new_node
    else
      @depth += 1
      Link.new(@new_node, @old_node.left_link, @depth)
    end
    depth
  end

  def link_right
    if @old_node.right_link == nil
      @old_node.right_link = @new_node
    else
      @depth += 1
      Link.new(@new_node, @old_node.right_link, @depth)
    end
    depth
  end

end
