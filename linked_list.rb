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

    def contains? (value, node= @head_node)
        node.value == value ? true : 
        node.next_node == nil ? false : 
        contains?(value, node.next_node)
    end

    def find(value, node= @head_node, index= 0)
        index += 1
        node.value == value ? index :
        node.next_node == nil ?  index = false :
        find(value, node.next_node, index)
    end

    def to_s(node= @head_node)
        print "(#{node.value}) -> "
        !node.next_node ? return : to_s(node.next_node)
    end

    def insert_at(value, index, node=@head_node)
        if index > self.size || index < 1
            return "This list starts at 1 and ends at #{self.size}"
        end

        index -= 1
        if index == 1
            new_node = Node.new(value)
            new_node.next_node = node.next_node
            node.next_node = new_node
            return
        end
        insert_at(value, index, node.next_node)
    end

    def remove_at(index, node=@head_node)
        if index > self.size || index < 1
            return "This list starts at 1 and ends at #{self.size}"
        end
        
        index -= 1
        if index == 1
            removed_node = node.next_node
            node.next_node = removed_node.next_node
            removed_node.next_node = nil
            return
        end
        remove_at(index, node.next_node)
    end

end

