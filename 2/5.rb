# You have two numbers represented by a linked list, where each node contains a
# single digit. The digits are stored in reverse order, such that the Ts digit
# is at the head of the list. Write a function that adds the two numbers and
# returns the sum as a linked list

require_relative "linked_list"

ll1 = LinkedListFactory.linked_list
ll2 = LinkedListFactory.linked_list

def integer_from_list(linked_list)
  total = 0
  linked_list.reverse
  linked_list.nodes.each_with_index do |node, index|
    total += node.data * 10**index
  end
  total
end

def add_integers(integer1, integer2)
  integer = integer1 + integer2
  rounds = Math.log10(integer).floor + 1

  p integer

  linked_list = nil

  minus = 0
  (1..rounds).each do |i|
    number = (integer - minus) % 10**i
    minus += number
    number = number / 10**(i-1)

    if linked_list.nil?
      linked_list = LinkedList.new Node.new(data: number)
    else
      linked_list.add_node Node.new(data: number)
    end
  end
  linked_list.reverse
  linked_list
end

ll1.print
ll2.print

int1 = integer_from_list(ll1)
int2 = integer_from_list(ll2)

# p int1, int2

new_ll = add_integers int1, int2

new_ll.print

