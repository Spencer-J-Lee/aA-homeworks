class MetaSnackBox
 	META_SNACK_BOX_DATA = {
    1 => {
      bone: {
        info: "Phoenician rawhide",
        tastiness: 20
      },
      kibble: {
        info: "Delicately braised hamhocks",
        tastiness: 33
      },
      treat: {
        info: "Chewy dental sticks",
        tastiness: 40
      }
		},     
		2 => {
      bone: {
        info: "An old dirty bone",
        tastiness: 2
      },
      kibble: {
        info: "Kale clusters",
        tastiness: 1
      },
      treat: {
        info: "Bacon",
        tastiness: 80
      }
		},     
		3 => {
      bone: {
        info: "A steak bone",
        tastiness: 64
      },
      kibble: {
        info: "Sweet Potato nibbles",
        tastiness: 45
      },
      treat: {
        info: "Chicken bits",
        tastiness: 75
      }
    }
	}
	
  def initialize(data = META_SNACK_BOX_DATA)
    @data = data
	end
	
	def get(box_id, food_type, food_attribute)
		@data[box_id][food_type][food_attribute]
	end

	def method_missing(*args)
		method_name = args[0].to_s
		box_id 			= args[1]

		raise "Must specific box id." if box_id.nil?

		if method_name.start_with?('get_')
			method_name 			 = method_name['get_'.length..-1]
			food_type_and_attr = method_name.split('_').map(&:to_sym)
			
			self.get(box_id, *food_type_and_attr)
		else
			super
		end
	end
end
