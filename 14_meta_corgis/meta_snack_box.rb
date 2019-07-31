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
end
