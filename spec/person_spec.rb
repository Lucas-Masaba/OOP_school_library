require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context "Testing Person class" do

    before :each do
      @person = Person.new(15, name: 'Ichigo', parent_permission: false)
      book = Book.new('Steve Jobs', 'Walter Isaacson')
      Rental.new('01-01-20', book, @person)
    end

    it "test if person name exist" do
      expect(@person.name).to eq('Ichigo')
    end

    it "test if person age exists" do
      expect(@person.age).to eq(15)
    end

    it "test the rentals array inside the person" do
      expect(@person.rentals.length).to eq(1)
    end


  end
end