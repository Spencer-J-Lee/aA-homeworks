system 'clear'

# my_min
# Given a list of integers find the smallest number in the list.

# Example:

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_subquadratic_min(arr)
	arr.each_with_index do |num1, i1|
		smallest = true

		arr.each_with_index do |num2, i2|
			next if i1 > i2
			smallest = false if num1 > num2
		end

		return num1 if smallest
	end
end

arr = (-100..100).to_a.shuffle
p my_subquadratic_min(arr) == -100 # time complexity == O(n^2)

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity?

def my_linear_min(arr)
	smallest = arr.first
	arr.each { |n| smallest = n if n < smallest }
	smallest
end

p my_linear_min(arr) == -100