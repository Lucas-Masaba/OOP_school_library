require 'json'
require './rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals.push(rental)
  end

  def self.path
    './data/books.json'
  end

  def self.read_books
    books_arr = []
    puts Book.path
    if File.exist?(Book.path)
      JSON.parse(File.read(Book.path)).each do |obj|
        books_arr << Book.new(obj['title'], obj['author'])
      end
    end
    books_arr
  end

  def self.save_data(books)
    books_data = []
    books.each do |book|
      books_data << { title: book.title, author: book.author }
    end
    File.write(Book.path, JSON.generate(books_data))
  end
end
