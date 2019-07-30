require 'binary_tree'

describe BinaryTree do
  context 'when creating a node' do
    it 'can store a value' do
      node = described_class.new(3)

      expect(node.value).to eq(3)
    end
  end

  context 'when inserting a node' do
    let(:tree) { described_class.new(9) }
    let(:right_node) { described_class.new(11) }
    let(:left_node) { described_class.new(7) }

    it 'can create a root node' do
      empty_tree = described_class.new
      node = described_class.new(5)

      empty_tree.insert(node)

      expect(empty_tree.value).to eq(5)
    end

    it 'can be on the left side if value is lesser than the parent value' do
      tree.insert(right_node)

      expect(tree.left).to be_nil

      tree.insert(left_node)

      expect(tree.left.value).to eq(left_node.value)
    end

    it 'can be on the right side if value is greater than the parent value' do
      tree.insert(left_node)

      expect(tree.right).to be_nil

      tree.insert(right_node)

      expect(tree.left.value).to eq(left_node.value)
    end
  end

  context 'when searching a node' do
    let(:tree) do
      node = described_class.new(5)

      [8, 3, 4, 2, 9, 7].each { |x| node.insert(described_class.new(x)) }
      node
    end

    it 'can show nothing if tree is not populated' do
      empty_tree = described_class.new

      expect(empty_tree.search(11)).to be_nil
    end

    it 'can show bottom left node' do
      node = tree.search(2)

      expect(node.left).to be_nil
      expect(node.right).to be_nil
      expect(node.value).to eq(2)
    end

    it 'can show bottom right node' do
      node = tree.search(9)

      expect(node.left).to be_nil
      expect(node.right).to be_nil
      expect(node.value).to eq(9)
    end

    it 'can show top node' do
      node = tree.search(5)

      expect(node.left).to_not be_nil
      expect(node.right).to_not be_nil
      expect(node.value).to eq(5)
    end
  end
end
