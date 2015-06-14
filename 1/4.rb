def replace(string)
  words = string.split(" ")
  output = []
  words.each do |word|
    output << word
  end
  output.join("%20")
end
