class CompleteMe

  attr_accessor :root

  def initialize(root = nil)
    @root = root
    @count = 0
  end

  def insert(word)
    if @root == nil
      @root = CompleteMeNode.new(word)
      @count += 1
      word
    else
      suggest(node)
  end
end

  def count
    @count
  end

  def suggest(node, current = @root)
    if (node.include?("piz"))
      current = ["pizza"]
      dictionary = File.read("/usr/share/dict/words")
      
    end
  end

end

  # def second_insert(node, current = @root)
  #   if (node.rating < current.rating) && current.left != nil
  #     current = current.left
  #     second_insert(node, current)
  #   elsif (node.rating < current.rating) && current.left.nil?
  #     current.left = node
  #   elsif (node.rating > current.rating) && current.right !=  nil
  #     current.left = node
  #   elsif (node.rating > current.rating) && current.right
  #     current = current.right
  #     second_insert(node, current)
  #   elsif (node.rating > current.rating) && current.right.nil?
  #     current.right = node
  #   end
  # end
