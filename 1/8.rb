def rotate_string(string)
  characters = string.split("")
  reverse_string = ""
  if characters.size > 0
    while characters.size > 0
      reverse_string += characters.pop
    end
  end
  reverse_string
end

def rotation?(string1, string2)
  substring? string1, rotate_string(string2)
end

def substring?(string1, string2)
  !string1[Regexp.new string2].nil?
end

p rotation?("waterbottle", "elttobretaw")
