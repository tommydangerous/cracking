def compress(string)
  output = []
  character_counts = {}
  last_character = nil

  characters = string.split("")

  length = characters.length

  characters.each_with_index do |character, index|
    last_character = character if last_character.nil?

    if character_counts[character]
      character_counts[character] += 1
    else
      character_counts[character] = 1
    end

    if index == length - 1
      output << [character, character_counts[character]].join("")
    elsif last_character != character
      output << [last_character, character_counts[last_character]].join("")

      character_counts[last_character] = nil
    end

    last_character = character
  end

  output.join("")
end
