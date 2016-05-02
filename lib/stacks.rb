# A stack is a first-in-last-out data structure. For this exercise, we have
# implemented a stack by storing data in an array, and providing you with a few
# instance methods. #pop removes the top (most recently added) element of the
# stack and #push adds a new item to the top of the stack. #push returns
# self so that you can chain multiple pushes together. #peek returns the top
# element of the stack without removing it from the stack size returns the
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

    def size
        return @arr.size
    end
end


# Use one or more stacks to determine if a given string is a palindrome. A
# palindrome is a string that reads the same forward and backward. Return
# true if the string is a palindrome otherwise it should return false.
def is_palindrome?(str)
end


# Use one or more stacks to determine if a string of grouping characters is
# balanced. The string will consist of (){}[]. The function should return true
# if they are balanced, otherwise it should return false.
# ex:
# balanced? {{}()[]}{()} # => true
# balanced? {}{}[}] #=> false
def balanced?(str)
end


# Implement a calculator that takes input in Reverse Polish Notation. RPN is
# described here: https://en.wikipedia.org/wiki/Reverse_Polish_notation.
# This method takes a string as a paramenter. The string will consist of numbers
# or "+", "-", "/", "*". Entries will be separated by spaces. The method should
# return a value.
def rpn_calculator(str)
end

# Create a new class that has the same behavior as a Stack but has an extra
# instance method that will return the value of the smallest value in the stack.
# This class inherits from Stack, but can have extra instance variables. You can
# override any of Stack's methods. Ask Eric for a hint if you get stuck before
# searching online.
class StackWithMin < Stack
    def min_value
    end
end

# Sort a stack using recursion. Your solution should not use any loops. You
# may create extra functions as needed. This method will take a stack as a
# parameter and should return a stack.
def sort_stack(stack)
    return stack
end


