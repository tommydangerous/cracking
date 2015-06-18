require_relative "selection_sort"

array = ["tar", "tommy", "army", "loser", "mary", "rat"]

def sort_letters_in_words(array)
  array.each_with_object([]) do |word, arr|
    letters = word.split ""
    arr << selection_sort(letters).join("")
  end
end

def anagram_sort(array)
  array = sort_letters_in_words array
  hash = {}
  array.each do |word|
    if hash[word].nil?
      hash[word] = 1
    else
      hash[word] += 1
    end
  end
  hash.map { |key, value| Array.new(value) { key } }.flatten.sort
end

p anagram_sort array
