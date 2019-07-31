require_relative 'meta_snack_box'
require 'pry'

class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

	def method_missing(food_type)
		if valid_food_type?(food_type)
			info      = get_info(food_type)
			tastiness = get_tastiness(food_type)
			food_type = food_type.capitalize

			result = [food_type, info, tastiness].join(': ')

			tastiness > 30 ? "* #{result}" : result
		else
			super
		end
  end

  def self.define_snack(name)
    # Your code goes here...
	end

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
