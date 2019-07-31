require_relative 'meta_snack_box'
require 'pry'

class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

	def method_missing(food_type)
		valid_methods = [:bone, :kibble, :treat]

		if valid_methods.include?(food_type)
			info      = @snack_box.send("get_#{food_type}_info", @box_id)
			tastiness = @snack_box.send("get_#{food_type}_tastiness", @box_id)

			result    = "#{food_type.capitalize}: #{info}: #{tastiness}"

			tastiness > 30 ? "* #{result}" : result
		else
			super
		end
  end

  def self.define_snack(name)
    # Your code goes here...
	end
end