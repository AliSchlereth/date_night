require_relative 'beths_node_example'

class LinkedList
attr_reader :head

  def initialize(data)
    @head = Node.new(data)
  end

end
