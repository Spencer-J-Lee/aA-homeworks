require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Bob') }
  subject(:dessert) { Dessert.new('ice cream', 69, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('ice cream')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(69)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('ice cream', '69', chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient('pineapple')
      expect(dessert.ingredients).to include('pineapple')
    end
  end
  
  describe "#mix!" do
    it "shuffles the ingredient array" do
      50.times do
        %w(apple cherry).each { |ingredient| dessert.add_ingredient(ingredient) }
      end

      unmixed_ingredients = dessert.ingredients.dup

      dessert.mix!

      expect(dessert.ingredients).to_not eq(unmixed_ingredients)
      expect(dessert.ingredients.sort).to eq(unmixed_ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect(dessert.quantity).to eq(69 - 5)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(70) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Bob the Great Baker')
      expect(dessert.serve).to eq("Chef Bob the Great Baker has made 69 ice creams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
