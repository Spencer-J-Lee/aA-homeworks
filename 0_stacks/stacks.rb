system 'clear'

class Stack
    def initialize
        @stack = [] 
    end

    def push(el)
        stack.push(el)
        el
    end

    def pop
        stack.pop 
    end

    def peek
        stack.last 
    end

    private

    attr_reader :stack
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.unshift(el)
        el
    end
    
    def dequeue
        queue.pop
    end
    
    def peek
        queue.last
    end

    private

    attr_reader :queue
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        pair_i = map.index { |pair| pair[0] == key }

        if pair_i
            map.each { |pair| return pair[1] = value if pair[0] == key }
        else    
            map << [key, value]
        end

        value
    end

    def get(key)
        map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end
    
    def delete(key)
        value = get(key)
        map.delete([key,value]) if value
        value
    end 
    
    def show
        deep_dup(map)
    end

    private
    attr_reader :map

    def deep_dup(map)
        map.map { |el| el.kind_of?(Array) ? deep_dup(el) : el }
    end
end

my_map = Map.new

my_map.set("a", 1)
my_map.set("b", 2)
my_map.set("c", 3)
p my_map.show

my_map.set("a", 5)
my_map.set("b", 6)
my_map.set("c", 7)
p my_map.show

p my_map.get("a")
p my_map.get("b")
p my_map.get("c")
p my_map.get("d")

my_map.delete("a")
p my_map.show


    # set method can create or update 
    # It's up to you to check whether a key currently exists!