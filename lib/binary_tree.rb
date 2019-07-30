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
    end
  end
end
