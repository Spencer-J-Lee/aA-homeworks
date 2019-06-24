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