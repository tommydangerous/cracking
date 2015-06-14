class HashTable
  LOAD_FACTOR = 0.7

  def initialize
    @size = 10
    initialize_array
  end

  def []=(key, value)
    slot_number = h(key)

    dynamic_array = @array[slot_number]
    k_v_pair = dynamic_array.find do |pair|
      pair[0] == key
    end

    if k_v_pair
      k_v_pair[1] = value
    else
      @array[slot_number] << [key, value]
    end
  end

  def [](key)
    slot_number = h(key)

    dynamic_array = @array[slot_number]

    k_v_pair = dynamic_array.find do |pair|
      pair[0] == key
    end

    k_v_pair[1] if k_v_pair
  end

  private

  def h(key)
    key.hash % @size
  end

  def initialize_array
    @array = Array.new(@size) { [] }
  end

  def reset
  end
end

def unique?(string)
  characters = HashTable.new

  string.split("").each do |character|
    if characters[character]
      return false
    else
      characters[character] = 1
    end
  end

  true
end
