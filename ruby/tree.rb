class Tree
	attr_accessor :children, :node_name

	# def initialize(name,children=[])
	# 	@children=children
	# 	@node_name=name
	# end

	def initialize(tree={})
		root=tree.entries[0]

		@node_name=root[0]
		@children=[]
		
		root[1].each_entry do |key,value|
			@children.push Tree.new({key=>value})
		end
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

# t=Tree.new("Apple",[Tree.new("Pear"),Tree.new("Orange")])
t=Tree.new({:Apple=>{:Pear=>{},:Orange=>{}}})

t.visit_all {|node| puts node.node_name}