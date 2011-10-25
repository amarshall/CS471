class Tree
  attr_reader :parent, :left, :right
  attr_accessor :value

  def initialize value = nil, left = nil, right = nil
    @value = value
    @left = left
    @right = right
  end

  def left= tree
    tree.parent = self if tree
    @left = tree
  end

  def right= tree
    tree.parent = self if tree
    @right = tree
  end

  def leaf?
    !@left && !@right
  end

  def root?
    !@parent
  end

  def each &block
    @left.each &block if @left
    yield self
    @right.each &block if @right
  end

  # Don't ever specify any arguments, it will make me very angry.
  def print level = 0
    @right.print(level + 1) if @right
    puts ('  ' * level) + to_s
    @left.print(level + 1) if @left
  end

  def to_a
    array = []
    array << @left.to_a if @left
    array << to_s
    array << @right.to_a if @right
    array.flatten
  end

  def to_s
    (@value || object_id).to_s
  end

  def self.generate num
    gen = ->(num, &block) do
      if num == 0
        block.call nil
      else
        (1..num).each do |root_position|
          gen.call(root_position - 1) do |left|
            gen.call(num - root_position) do |right|
              block.call Tree.new nil, left, right
            end
          end
        end
      end
    end

    trees = []
    gen.call(num) { |tree| trees << tree }
    trees.compact
  end

  protected

  def parent= tree
    @parent = tree
  end
end
