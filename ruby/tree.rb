class Tree
  attr_accessor :children, :node_name
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
    #yield self
  end
end

ruby_tree = Tree.new("Ruby",
  [Tree.new("Reia"),
   Tree.new("MacRuby")])
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}

data = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

class RecursiveTree < Tree
  def initialize(hash)
    @node_name = hash.keys.first
    @children = []
    if hash[@node_name] != {}
      hash[@node_name].each do |key, value|
	children.push(RecursiveTree.new({key => value}))
      end
    end
  end
end

rt = RecursiveTree.new(data)
rt.visit_all {|node| puts node.node_name}
