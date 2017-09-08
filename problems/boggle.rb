require 'set'

def findWords(board, dictionary)
  @result = Set.new
  traverse(board, dictionary)
  @result.sort.each do |r|
    puts r
  end


end


def traverse(board, dictionary)
  build_dict(dictionary)
  build_trie(dictionary)
  build_board(board)

  length = @board.length
  length.times do |i|
    length.times do |j|
      visit_set = Set.new
      visit_set << [i,j]
      rec_traverse(@board[i][j], visit_set, [i,j])
    end
  end
end

def build_trie(dict)
  @trie_dict = Trie.new
  dict.each do |e|
    @trie_dict.insert(e.downcase)
  end
end

def build_board(board)
  @board = []
  board.each do |row|
    @board << row.map(&:downcase)
  end
end

def build_dict(dictionary)
  @dict = Set.new(dictionary.map(&:downcase))
end


def rec_traverse(cur, visit_set, ordinates)
  if cur.length >=3 && @dict.include?(cur)
    @result << cur
  end

  adjacents = adjacents(visit_set, ordinates)

  adjacents.each do |values|
    new_cur = cur + @board[values.first][values.last]
    next unless @trie_dict.have?(new_cur)

    new_visit_set = visit_set.clone
    new_visit_set << values

    rec_traverse(new_cur, new_visit_set, values)
  end
end

def adjacents(visit_set, ordinates)
  adjacents = [
      [ordinates.first - 1, ordinates.last],
      [ordinates.first + 1, ordinates.last],
      [ordinates.first, ordinates.last - 1],
      [ordinates.first, ordinates.last + 1],
      [ordinates.first + 1, ordinates.last - 1],
      [ordinates.first - 1, ordinates.last + 1],
      [ordinates.first - 1, ordinates.last - 1],
      [ordinates.first + 1, ordinates.last + 1],
  ]

  adjacents.reject!{ |pair| pair.first < 0 || pair.last < 0  }
  adjacents.reject!{ |pair| pair.first >  @board.length - 1 || pair.last > @board.length - 1 }
  adjacents.reject{|pair| visit_set.include?(pair)}
end

class Node
  attr_reader :data, :children
  attr_accessor :term
  def initialize(data)
    @data = data
    @children = []
    @term = false
  end

  def insert(char)
    return get(char) if have?(char)

    child = Node.new(char)
    @children << child
    child
  end

  def have?(char)
    @children.each do |c|
      return true if c.data == char
    end

    false
  end

  def get(char)
    @children.each do |child|
      return child if child.data == char
    end

    false
  end
end

class Trie
  attr_reader :root
  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    node = @root
    word.size.times do |i|
      child = node.insert(word[i])
      node = child
    end
    node.term = true
  end

  def have?(word)
    node = @root
    word.size.times do |i|
      return false unless node.have?(word[i])
      node = node.get(word[i])
    end

    return true
  end
end






board = [%w(p w y r), %w(e n t h), %w(g s i q), %w(o l s a)]
dict= %w(hit hits kilts peg pen pep pentagon slit slits stilts)

findWords(board, dict)
