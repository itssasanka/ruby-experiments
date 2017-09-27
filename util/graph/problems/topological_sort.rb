# Do topological sort on a directed acyclic graph
require_relative '../graph_util'

def topological_sort(graph)
  @visited = Set.new
  @order = []

  graph.nodes.each do |n|
    rec_topological_sort(n)
  end
end

def rec_topological_sort(node)
  return if @visited.include?(node)

  @visited << node
  node.adjacents.each do |n|
    rec_topological_sort(n)
  end
  @order.unshift(node)
end

def print_result
    puts @order.map(&:dump)
end


n1 = GraphNode.new('a')
n2 = GraphNode.new('b')
n3 = GraphNode.new('c')
n4 = GraphNode.new('d')
n5 = GraphNode.new('e')
n6 = GraphNode.new('f')
n7 = GraphNode.new('g')

g = Graph.new
g.nodes = [n1,n2,n3,n4,n5,n6, n7]

g.add_edge(n1, n3)
g.add_edge(n2, n3)
g.add_edge(n3, n5)
g.add_edge(n2, n4)
g.add_edge(n4, n6)
g.add_edge(n5, n6)
g.add_edge(n6, n7)

topological_sort(g)
print_result
