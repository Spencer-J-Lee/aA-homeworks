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

# O(n^2) quadratic time
def my_quadratic_min(arr)
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
p my_quadratic_min(arr) == -100 

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. 
# What is the time complexity?

# O(n) linear time
def my_linear_min(arr)
	smallest = arr.first
	arr.each { |n| smallest = n if n < smallest }
	smallest
end

p my_linear_min(arr) == -100

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.
		
# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. 
# Then find the sums of each sub-array and return the max.

# O(n^3) cubic time
def largest_contiguous_sum_cubic(arr)
	subarrs = []

	arr.each_index do |i|
		arr.each_index do |j|
			next if i > j
			subarrs << arr[i..j]
		end
	end

	subarrs.map(&:sum).max
end

arr = [3, 2, -9, 7, -6, 7]
p largest_contiguous_sum_cubic(arr) == 8
arr2 = [-6, -3, -1, -5]
p largest_contiguous_sum_cubic(arr2) == -1


# 0(n^2) quadratic time
def largest_contiguous_sum_quadratic(arr)
	largest_sum = arr.first

	arr.each_index do |start|
		arr.each_index do |stop|
			next if start > stop
			sum         = arr[start..stop].sum 
			largest_sum = sum if sum > largest_sum
		end
	end

	largest_sum
end

p largest_contiguous_sum_quadratic(arr) == 8
p largest_contiguous_sum_quadratic(arr2) == -1

# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. 
# Write a new function using O(n) time with O(1) memory. 
# Keep a running tally of the largest sum.

# 0(n) linear time
def largest_contiguous_sum_linear(arr)
	largest_sum = arr.first
	current_sum = arr.first

	arr.drop(1).each do |n|
		current_sum = 0 if current_sum < 0
		current_sum += n
		largest_sum = current_sum if current_sum > largest_sum
	end

	largest_sum
end

p largest_contiguous_sum_linear(arr) == 8
p largest_contiguous_sum_linear(arr2) == -1

# Get your story straight, and then explain your solution's time complexity to your TA.