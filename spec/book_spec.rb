require_relative '../book'
require_relative '../student'
require_relative '../rental'

describe Book do
  context 'Testing book class' do
    before :each do
      @book = Book.new('Steve Jobs', 'Walter Isaacson')
      student = Student.new(15, 'Bankai', name: 'Ichigo', parent_permission: false)
      Rental.new('01-01-20', @book, student)
    end

    it 'test if book title exist' do
      expect(@book.title).to eq('Steve Jobs')
    end

    it 'test if book author exists' do
      expect(@book.author).to eq('Walter Isaacson')
    end

    it 'test the rentals array inside the book' do
      expect(@book.rentals.length).to eq(1)
    end
  end
end
