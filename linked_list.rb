class Node
    attr_accessor :next_node, :value
    def initialize(value= nil, next_node= nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    attr_reader :head_node, :last_node
    def initialize(value)
        @head_node = Node.new(value)
        @last_node = @head_node
    end

    def append(value)
        new_node = Node.new(value)
        @last_node.next_node = new_node
        @last_node = new_node
    end

    def prepend(value)
        new_node = Node.new(value)
        new_node.next_node = @head_node
        @head_node = new_node
    end

    def size(node= @head_node, count= 1)
        node.next_node ? size(node.next_node, count + 1) : count
    end

    def head
        @head_node
    end

    def tail
        @last_node
    end

    def at(node= @head_node, index) 
        index > self.size || index < 1 ? "This list starts at 1 and ends at #{self.size}": 
        index == 1 ? node: at(node.next_node ,index - 1)
    end
    
    def pop
        @last_node = at(self.size - 1)
        @last_node.next_node = nil
    end

    def contains? (value, node= @head_node, found= false)
        node.value == value ? true : 
        node.next_node == nil && !found ? false : 
        found = contains?(value, node.next_node, found)
    end

    def find(value, node= @head_node, index= 0, found= false)
        index += 1
        node.value == value ? index :
        node.next_node == nil && !found ?  index = false :
        index = find(value, node.next_node, index, found)
    end
end


list = LinkedList.new("this is the head")
list.append("I am a node")
list.append("this is another node")
list.append("and anotherr")
p list.find("and anotherr")
p list.size