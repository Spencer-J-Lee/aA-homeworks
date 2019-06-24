system 'clear'

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths

def sluggish_octopus(fishes)
	longest_fish = nil

	fishes.each do |fish1|
		fishes.each do |fish2|
			longest_fish = fish1 if fish1.length > fish2.length
		end
	end

	longest_fish
end

p sluggish_octopus(fishes) == 'fiiiissshhhhhh'

# Dominant Octopus
# Find the longest fish in O(n log n) time. Remember that Big O is classified by the dominant term.

def dominant_octopus(fishes)
	return fishes if fishes.count < 2

	middle      							= fishes.length / 2
	left, right 							= fishes.take(middle), fishes.drop(middle)
	sorted_left, sorted_right = dominant_octopus(left), dominant_octopus(right)

	merge(sorted_left, sorted_right)
end

def merge(left, right)
	merged = []

	until left.empty? || right.empty?
		merged << (left.first.length < right.first.length ? left.shift : right.shift)
	end

	merged + left + right
end

p dominant_octopus(fishes).last == "fiiiissshhhhhh"

# Clever Octopus
# Find the longest fish in O(n) time. 
# The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.

def clever_octopus(fishes)
	longest_fish = nil

	fishes.each do |fish|
		longest_fish = fish if longest_fish.nil? || fish.length > longest_fish.length
	end

	longest_fish
end

p clever_octopus(fishes) == "fiiiissshhhhhh"

# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# To play the game, the octopus must step on a tile with her corresponding tentacle. 
# We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.

# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. 
# This should take O(n) time.

def slow_dance(direction, tiles_array)
	tiles_array.each_index { |i| return i if tiles_array[i] == direction }
end

p slow_dance("up", tiles_array) == 0
p slow_dance("right-down", tiles_array) == 3

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. 
# Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.

tiles_hash = {}
tiles_array.each_with_index { |tile, i| tiles_hash[tile] = i }

def fast_dance(direction, tiles_hash)
	tiles_hash[direction]
end

p fast_dance("up", tiles_hash) == 0
p fast_dance("right-down", tiles_hash) == 3