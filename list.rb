class Node
  attr_accessor :value, :next_node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :length, :head
  def initialize(value = nil)
    @head = Node.new(value)
  end

  def append(value)
    if @head.value.nil?
      @head = Node.new(value)
    else
      current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    temp = 0
    current_node = @head
    until temp == index
      current_node = current_node.next_node
      temp += 1
    end
    current_node
  end

  def pop
    count = 1
    temp = size - 1
    current_node = @head
    until count == temp
      current_node = current_node.next_node
      count += 1
    end
    current_node.next_node = nil
  end

  def contains?(value)
    ans = false
    current_node = @head
    until current_node.next_node.nil?
      if current_node.value == value
        ans = true
      end
      current_node = current_node.next_node
    end
    ans
  end

  def find(value)
    ans = nil
    ind = 0
    current_node = @head
    until current_node.next_node.nil?
      if current_node.value == value
        ans = ind
      end
      current_node = current_node.next_node
      ind += 1
    end
    ans
  end

  def to_s
    current_node = @head
    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    print 'nil '
  end

  def insert_at(value, index)
    temp = 1
    current_node = @head
    if index.zero?
      prepend(value)
    elsif index > size - 1
      puts "that index does not exist"
    else
      until temp == index
        current_node = current_node.next_node
        temp += 1
      end
      link = current_node.next_node
      current_node.next_node = Node.new(value, link)
    end
  end

  def remove_at(index)
    temp = 1
    current_node = @head
    next_node = @head
    if index > size - 1 || index < 0
      puts 'that index does not exist'
    elsif index == size - 1
      pop
    else
      until temp == index
        current_node = current_node.next_node
        temp += 1
      end
      until temp == index + 1
        next_node = next_node.next_node
        temp += 1
      end
      current_node.next_node = next_node.next_node
    end
  end
end

x = LinkedList.new('Bob')
x.append('Jim')
x.append('Joe')
x.prepend('Tom')
puts x.size
# puts x.head
# puts x.tail
puts x.at(0)
puts x.at(1)
puts x.at(2)
puts x.at(3)
x.pop
puts x.size
puts x.at(0)
puts x.at(1)
puts x.at(2)

p x.contains?('Joe')
p x.contains?('Tom')

x.insert_at('Joe', 2)

x.to_s

x.remove_at(3)

x.to_s
