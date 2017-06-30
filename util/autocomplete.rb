



require './trie'


t = Trie.new
t.add("abc")
t.add("abcde")
t.add("abde")
t.add("abxye")
t.add("abxae")

puts t.autocomplete("abx")









