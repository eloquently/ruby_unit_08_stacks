require 'stacks'

def to_stack(str)
    stack = Stack.new
    str.split('').each { |c| stack.push(c) }
    return stack
end

def is_sorted?(stack)
    prev = stack.pop
    while true
        curr = stack.pop
        break if curr.nil?
        return false if curr > prev
        prev = curr
    end
    return true
end


describe "stack questions" do

    describe "is_palindrome?" do
        it 'returns false if not palindrome' do
            expect(is_palindrome?("abac")).to eq(false)
            expect(is_palindrome?("abca")).to eq(false)
        end

        it 'returns true if is palindrome' do
            expect(is_palindrome?("racecar")).to eq(true)
            expect(is_palindrome?("aaaddeeddaaa")).to eq(true)
            expect(is_palindrome?("aaaddeddaaa")).to eq(true)
            expect(is_palindrome?("a")).to eq(true)
        end
    end

    describe "balanced?" do
        it 'returns false if not balanced' do
            expect(balanced?("{({[}]}")).to eq(false)
            expect(balanced?("{{[]()}")).to eq(false)
            expect(balanced?("{){[}]}")).to eq(false)
        end

        it 'returns true if balanced' do
            expect(balanced?("{{[]}}")).to eq(true)
            expect(balanced?("{{[]()}}")).to eq(true)
            expect(balanced?("{([[[]()]({})])}")).to eq(true)
        end
    end

    describe "rpn_calculator" do
        it 'returns correct value' do
            expect(rpn_calculator("5 1 2 + 4 × + 3 −")).to eq(14)
            expect(rpn_calculator("4 2 5 * + 1 3 2 * + /")).to eq(2)
            expect(rpn_calculator("9 5 3 + 2 4 ^ - +")).to eq(11)
        end
    end

    describe "sort_stack" do
        it 'returns sorted stack' do
            expect(is_sorted?(sort_stack(Stack.new.push(3).push(5).push(8).push(10).push(2).push(15)))).to eq(true)
            expect(is_sorted?(sort_stack(Stack.new.push(4).push(3).push(2).push(1)))).to eq(true)
            expect(is_sorted?(sort_stack(Stack.new.push(1).push(3).push(7).push(2)))).to eq(true)
        end
    end

    describe "min_stack" do
        it 'tracks min' do
            s = StackWithMin.new
            s.push(3)
            expect(s.min_value).to eq(3)
            s.push(4)
            expect(s.min_value).to eq(3)
            s.push(2)
            expect(s.min_value).to eq(2)
            s.push(1)
            expect(s.min_value).to eq(1)
            s.push(10)
            expect(s.min_value).to eq(1)
            s.pop
            expect(s.min_value).to eq(1)
            s.pop
            expect(s.min_value).to eq(2)
            s.push(0)
            expect(s.min_value).to eq(0)
            s.pop
            expect(s.min_value).to eq(2)
        end
    end
end