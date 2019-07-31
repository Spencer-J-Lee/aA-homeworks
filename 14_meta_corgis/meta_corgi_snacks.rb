require_relative 'meta_snack_box'
require 'pry'

class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

	# def method_missing(food_type)
	# 	if valid_food_type?(food_type)
	# 		info      = get_info(food_type)
	# 		tastiness = get_tastiness(food_type)
	# 		food_type = food_type.capitalize

	# 		result = [food_type, info, tastiness].join(': ')

	# 		tastiness > 30 ? "* #{result}" : result
	# 	else
	# 		super
	# 	end
  # end

  def self.define_snack(name)
		define_method(name) do
			info      = get_info(name)
			tastiness = get_tastiness(name)
			name      = name.capitalize

			result = [name, info, tastiness].join(': ')

			tastiness > 30 ? "* #{result}" : result
		end
	end

	define_snack(:bone)
	define_snack(:kibble)
	define_snack(:treat)

	private

	def valid_food_type?(food_type)
		[:bone, :kibble, :treat].include?(food_type)
	end

	def get_info(food_type)
		@snack_box.send("get_#{food_type}_info", @box_id)
	end

	def get_tastiness(food_type)
		@snack_box.send("get_#{food_type}_tastiness", @box_id)
	end
end

# For Testing

box = MetaSnackBox.new
snacks = MetaCorgiSnacks.new(box, 3)

binding.pry