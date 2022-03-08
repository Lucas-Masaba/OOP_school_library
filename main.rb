require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './app'

def cases(app, answer)
  case answer
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_person
  when 4
    app.create_a_book
  when 5
    app.create_a_rental
  when 6
    app.list_persoal_rentals
  else
    app.save_data
    puts 'Thank you for using this app :)'
  end
end

def main
  app = App.new

  puts 'Welcome to the school library App!'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    answer = gets.chomp.to_i
    cases(app, answer)
    break if answer == 7
  end
end

main
