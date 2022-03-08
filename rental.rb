require './person'
require 'json'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  def self.path
    './data/rentals.json'
  end

  def self.read_rentals(people)
    rentals_arr = []
    if File.exist?(Rental.path)
      JSON.parse(File.read(Rental.path)).each do |obj|
        person = people.select { |p| p.id == obj['personId'] }[0]
        book = Book.new(obj['book']['title'], obj['book']['author'])
        rentals_arr << Rental.new(obj['date'], book, person)
      end
    end
    rentals_arr
  end

  def self.save_data(rentals)
    rentals_data = []
    rentals.each do |rental|
      rentals_data << { date: rental.date, personId: rental.person.id,
                        book: { title: rental.book.title, author: rental.book.author } }
    end
    File.write(Rental.path, JSON.generate(rentals_data))
  end
end
