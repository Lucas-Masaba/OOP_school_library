require 'json'
require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  @@path = './data/books.json'

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end

  def self.read_books
    books_arr = []
    if File.exists?(@@path)
      JSON.parse(File.read(@@path)).each do |obj|
        books_arr << Book.new(obj['title'], obj['author'])
      end
    end
    books_arr
  end

  def self.save_data(books)
    books_data = []
    books.each do |book| 
      books_data << {title: book.title, author: book.author}
    end
    File.write('./data/books.json', JSON.generate(books_data))
  end
end
