require_relative 'Node.rb'

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
    while current_node != nil
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
      while current_node.next_node != @tail
        current_node = current_node.next_node
      end
    end
    popped_node = @tail
    @tail = current_node
    @tail.next_node = nil
    popped_node
  end

  def contains?(value)
    current_node = @head
    while current_node != nil
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    current_index = 0
    while current_node != nil
      return current_index if current_node.value == value
      current_node = current_node.next_node
      current_index += 1
    end
    nil
  end
end

list = LinkedList.new
list.append(1)
list.append(5)
list.append(3)
puts list.find(5)
