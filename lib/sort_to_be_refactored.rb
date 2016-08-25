def sort
  node = @head
  if node.left_link == nil && node.right_link == nil
    movie_hash = Hash[node.title, node.score]
    @sorted << movie_hash
  elsif sorted.include?({@head.title => @head.score})
    # binding.pry
    traverse_right(node) if node.right_link != nil
    return @sorted if node.right_link == nil
    # binding.pry
  else
    # binding.pry
    traverse_left(node) if node.left_link != nil
    # binding.pry
  end
  sorted
end

def traverse_left(node)
  # binding.pry
  if node.left_link == nil
    if sorted.include?({node.title => node.score})
      check_right(node)
    else
      movie_hash = Hash[node.title, node.score]
      @sorted << movie_hash
      sort
    end
  elsif node.left_link != nil
    # binding.pry
    if sorted.include?({node.left_link.title => node.left_link.score})
      # binding.pry
      if node == @head
        # binding.pry
        movie_hash = Hash[node.title, node.score]
        @sorted << movie_hash
        # binding.pry
        sort
      end
      check_right(node)
    else
      node = node.left_link
      traverse_left(node)
    end
  end
end

def check_right(node)
  if node.right_link == nil
    movie_hash = Hash[node.title, node.score]
    @sorted << movie_hash
    sort
  elsif node.right_link != nil
    if sorted.include?({node.right_link.title => node.right_link.score})
      movie_hash = Hash[node.title, node.score]
      @sorted << movie_hash
      sort
    else
      node = node.right_link
    end
  end
end

def traverse_right(node)
  # binding.pry
  return @sorted if node == nil
    if node.right_link == nil
      check_left(node)
    else
      node.right_link != nil
      check_left(node)
    end
end

def check_left(node)
  return @sorted if node == nil
  if node.left_link == nil
    if sorted.include?({node.title => node.score}) == false
      movie_hash = Hash[node.title, node.score]
      @sorted << movie_hash
       if node.right_link == nil
        #  binding.pry
         return sorted
       end
    # Needs to return
      sort
    else
      node = node.right_link
      traverse_right(node)
    end
  elsif node.left_link != nil
    if sorted.include?({node.left_link.title => node.left_link.score})
      if sorted.include?({node.title => node.score})
        # binding.pry
        node = node.right_link
        traverse_right(node)
      end
      movie_hash = Hash[node.title, node.score]
      @sorted << movie_hash
      sort
    # elsif sorted.include?({node.title => node.score})
    #   node = node.right_link
    #   traverse_right(node)
    else
      node = node.left_link
      traverse_right(node)
    end
  #
  end
end
