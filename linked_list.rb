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
end
