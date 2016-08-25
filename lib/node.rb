require_relative 'link'
require 'pry'

class Node

  attr_reader :score, :title, :link
  attr_accessor :left_link, :right_link

  def initialize(score, title)
    @score = score
    @title = title
    @left_link = nil
    @right_link = nil
  end

  def next_node(node)
    @link = Link.new(node, self)
    @link.depth
  end

  def left_link
    @left_link
  end

  def right_link
    @right_link
  end


end
