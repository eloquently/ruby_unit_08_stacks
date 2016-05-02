# A stack is a first-in-last-out data structure. For this exercise, we have
# implemented a stack by storing data in an array, and providing you with a few
# instance methods. #pop removes the top (most recently added) element of the
# stack and #push adds a new item to the top of the stack. #push returns
# self so that you can chain multiple pushes together. #peek returns the top
# element of the stack without removing it from the stack. #count returns the
# number of elements in the stack.

class Stack
    def initialize
        @arr = Array.new
    end

    def pop
        return @arr.pop
    end

    def push(new_element)
        @arr.push(new_element)
        return self
    end

    def peek
        return @arr[-1]
    end

    def count
        return @arr.count
    end
end


# Use one or more stacks to determine if a given string is a palindrome. A
# palindrome is a string that reads the same forward and backward. Return
# true if the string is a palindrome otherwise it should return false.
def is_palindrome?(str)
    st = Stack.new
    chars = str.split('')
    chars.each { |c| st.push(c) }
    new_chars = []
    chars.count.times { new_chars << st.pop }
    return chars == new_chars
end


# Use one or more stacks to determine if a string of grouping characters is
# balanced. The string will consist of (){}[]. The function should return true
# if they are balanced, otherwise it should return false.
# ex:
# balanced? {{}()[]}{()} # => true
# balanced? {}{}[}] #=> false
def balanced?(str)
    st = Stack.new
    str.split('').each do |c|
        if c == "{" or c == "(" or c == "["
            st.push(c)
        else
            o = st.pop
            return false unless (o == "{" and c == "}") or
                                (o == "(" and c == ")") or
                                (o == "[" and c == "]")
        end
    end
    if st.count == 0
        return true
    else
        return false
    end
end


# Implement a calculator that takes input in Reverse Polish Notation. RPN is
# described here: https://en.wikipedia.org/wiki/Reverse_Polish_notation.
# This method takes a string as a paramenter. The string will consist of numbers
# or "+", "-", "/", "*". Entries will be separated by spaces. The method should
# return a value.
def rpn_calculator(str)
    elements = str.split(' ')
    st = Stack.new
    elements.count.times do |i|
        n = elements[i]
        if n == "+" or n == "-" or n == "/" or n == "*"
            val_1 = st.pop
            val_2 = st.pop
            st.push(val_2.send(n, val_1))
        else
            st.push(n.to_i)
        end
    end
    return st.pop
end

# Create a new class that has the same behavior as a Stack but has an extra
# instance method that will return the value of the smallest value in the stack.
# This class inherits from Stack, but can have extra instance variables. You can
# override any of Stack's methods. Ask Eric for a hint if you get stuck before
# searching online.
class StackWithMin < Stack
    def initialize
        super
        @min_stack = Stack.new
    end

    def push(new_element)
        super(new_element)
        if !@min_stack.peek.nil? and @min_stack.peek < new_element
            @min_stack.push(@min_stack.peek)
        else
            @min_stack.push(new_element)
        end
    end

    def pop
        ret = super
        @min_stack.pop
        return ret
    end

    def min_value
        @min_stack.peek
    end
end

# Sort a stack using recursion. Your solution should not use any loops. You
# may create extra functions as needed. This method will take a stack as a
# parameter and should return a stack.
def sort_stack(stack)
    if stack.count > 0
        top = stack.pop
        sort_stack(stack)
        insert_in_order(top, stack)
    end
    return stack
end

def insert_in_order(top, stack)
    if stack.count == 0 or top > stack.peek
        stack.push(top)
    else
        next_top = stack.pop
        insert_in_order(top, stack)
        stack.push(next_top)
    end
end

