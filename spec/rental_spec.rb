require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  context "Testing Rental class" do

    before :each do
      @person = Person.new(15, name: 'Ichigo', parent_permission: false)
      @book = Book.new('Steve Jobs', 'Walter Isaacson')
      @rental = Rental.new('01-01-20', @book, @person)
    end

    it "test if date exists" do
      expect(@rental.date).to eq('01-01-20')
    end

    it "test the rentals array inside of the book object" do
      expect(@book.rentals[0]).to eq(@rental) 
    end

    it "test the rentals array inside of the person object" do
      expect(@person.rentals[0]).to eq(@rental) 
    end


  end
end