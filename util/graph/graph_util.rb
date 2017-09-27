require 'set'

class GraphNode
  attr_accessor :adjacents

  def initialize(val)
    @adjacents = Set.new
    @val = val
  end

  def dump
    @val.to_s
  end
end

class Graph
  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_edge(from, to)
    from.adjacents << to
  end
end
