class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    node = Node.new()
    node.value = value
    if @head.nil?
      @head = node
    else
      last_node = @head
      until last_node.next_node.nil?
        last_node = last_node.next_node
      end
      last_node.next_node = node
    end
  end

  def prepend(value)
    node = Node.new()
    node.value = value
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    if @head.nil?
      return 0
    else
      node = @head
      count = 1
      while !node.next_node.nil?
        count += 1
        node = node.next_node
      end
      count
    end
  end

  def tail
    node = @head
    until node.next_node.nil?
      node = node.next_node
    end
    node
  end

  def head
    if @head.nil?
      return "nothing"
    else
      return @head.value
    end
  end

  def at(index)
    node = @head
    while index > 0
      node = node.next_node
      index -= 1
    end
    node
  end

  def pop
    if @head.next_node.nil?
      @head = nil
    else
      node = @head
      until node.next_node.nil?
        node = node.next_node
        up_one = node.next_node

        break if up_one.next_node.nil?
      end
      node.next_node = nil
    end
  end

  def contains?(value)
    node = @head
    until node.next_node.nil?
      if node.value == value
        return true
      end
      node = node.next_node
    end
    node.value == value
  end

  def find(value)
    idx = 0
    node = @head
    until node.next_node.nil?
      if node.value == value
        return idx
      end
      idx += 1
      node = node.next_node
    end
    
    node.value == value ? idx : nil
  end

  def to_s
    list = ""

    if @head.nil?
      list += "nil"
    else
      node = @head
      until node.next_node.nil?
        list += "(#{node.value}) -> "
        node = node.next_node
      end

      list += "(#{node.value}) -> nil"
    end

    puts list
  end
end

ll = LinkedList.new()
ll.append(5)
ll.prepend(4)
ll.append(6)

ll.to_s