require_relative "node"

class Queue
  attr_reader :first, :last

  def initialize(node = nil)
    set_first(node) unless node.nil?
  end

  def empty?
    first.nil? && last.nil?
  end

  def nodes
    n = []
    node = first
    while node
      n.push node
      node = node.next_node
    end
    n
  end

  def pop
    node   = first
    @first = node.next_node
    @last  = nil if first.nil?

    node.delete
    node
  end

  def push(node)
    if first.nil?
      set_first node
    else
      set_last node
    end
  end

  def print
    p nodes.map { |n| n.data }
  end

  private

  def set_first(node)
    @first = node
    @last  = node
  end

  def set_last(node)
    last.next_node     = node
    node.previous_node = last
    @last              = node
  end
end

class Animal < Node
end

class AnimalLink < Node
  attr_reader :animal

  def initialize(options = {})
    super options
    @animal = options[:animal]
    @data   = animal.data
  end
end

class AnimalShelter
  def initialize
    @animals         = Queue.new
    @animals_holding = Queue.new
    @cats    = Queue.new
    @dogs    = Queue.new
  end

  def dequeue_any
    animal_link = @animals.pop
    if animal_link.animal.data == "cat"
      @cats.pop
    else
      @dogs.pop
    end
  end

  def dequeue_cat
    return if @cats.empty?
    animal = @cats.pop
    dequeue_animal animal
    animal
  end

  def dequeue_dog
    return if @dogs.empty?
    animal = @dogs.pop
    dequeue_animal animal
    animal
  end

  def enqueue(animal)
    @animals.push AnimalLink.new(animal: animal)
    if animal.data == "cat"
      @cats.push animal
    else
      @dogs.push animal
    end
  end

  def print
    [@animals, @cats, @dogs].each do |queue|
      queue.print
    end
  end

  private

  def dequeue_animal(animal)
    dequeue_animal_link animal
    until @animals.empty?
      @animals_holding.push @animals.pop
    end
    until @animals_holding.empty?
      @animals.push @animals_holding.pop
    end
  end

  def dequeue_animal_link(animal)
    animal_link = @animals.pop
    if animal_link.animal != animal
      dequeue_animal_link animal
      @animals_holding.push animal_link
    end
  end
end

shelter = AnimalShelter.new
15.times do
  shelter.enqueue Animal.new(data: rand(2) == 0 ? "cat" : "dog")
end

shelter.print
puts "-" * 20
shelter.dequeue_dog
shelter.print
