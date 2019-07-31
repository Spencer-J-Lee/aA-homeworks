require_relative 'meta_snack_box'

class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def method_missing(name, *args)
    # Your code goes here...
  end


  def self.define_snack(name)
    # Your code goes here...
  end
end
