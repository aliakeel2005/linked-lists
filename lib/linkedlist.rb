require_relative 'node'

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    puts Node.size
  end

  def head
    puts @head.value
  end

  def tail
    puts @tail.value
  end

  def at(index)
    current_node = @head
    current_index = 0
    until current_node.nil?
      return current_node.value if current_index == index

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def pop
    if head.nil?
      return nil
    elsif Node.size = 1
      popped_node = @tail
      @head = nil
      @tail = nil
      return popped_node
    else
      current_node = @head
      current_node = current_node.next_node while current_node.next_node != @tail
    end

    popped_node = @tail
    @tail = current_node
    @tail.next_node = nil
    popped_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    current_index = 0
    until current_node.nil?
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end

  def to_s
    string = ''
    current_node = @head
    current_index = 0
    until current_node.nil?
      string += "(#{current_node.value}) -> "
      current_node = current_node.next_node
      current_index += 1
      return string += "(#{current_node.value}) -> nil" if current_node.next_node.nil?
    end
  end
end

list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list
