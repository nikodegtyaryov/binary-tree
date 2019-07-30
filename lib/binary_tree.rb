class BinaryTree
  attr_accessor :value, :right, :left

  def initialize(value = nil)
    @value = value
    @right = nil
    @left = nil
  end

  def insert(node)
    return self.value = node.value if value.nil?

    if node.value < value
      self.left = BinaryTree.new if left.nil?
      left.insert(node)
    elsif node.value > value
      self.right = BinaryTree.new if right.nil?
      right.insert(node)
    end
  end

  def search(node_value)
    return nil if value.nil?
    return self if node_value == value
    return left.search(node_value) if node_value < value
    return right.search(node_value) if node_value > value
  end
end
