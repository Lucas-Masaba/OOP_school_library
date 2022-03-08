require './book'
class App
  attr_reader :books, :people4

  def initialize
    @books = Book.read_books
    @people = []
    @rentals = []
  end

  def save_data
    Book.save_data(@books)
    File.write('./data/people.json', JSON.generate(@people.to_json))
    File.write('./data/rentals.json', JSON.generate(@rentals.to_json))

  end


  def list_all_books
    if @books.count.zero?
      puts 'No books added yet'
    else
      @books.map { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'No one borrowed a book'
    else
      @people.map { |person| puts "[#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}" }
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Wrong input. Please input 1 or 2'
    end

    puts 'Person created successfully'
  end

  def create_student
    age, name = age_and_name

    clsrom = classroom

    perm = permission

    student = Student.new(age, clsrom, name: name, parent_permission: perm == 'Y')
    @people << student
  end

  def create_teacher
    age, name = age_and_name

    spec = specialization

    teacher = Teacher.new(age, spec, name: name)
    @people << teacher
  end

  def age_and_name
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    [age, name]
  end

  def classroom
    print 'Classroom:'
    gets.chomp
  end

  def permission
    print 'Has parent permission? [Y/N]: '
    gets.chomp
  end

  def specialization
    print 'Specialization:'
    gets.chomp
  end

  def create_a_book
    title, author = title_author

    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
  end

  def title_author
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_a_rental
    if @books.length.zero? && @people.length.zero?
      puts 'No books and people :('
    else
      book = check_books_length
      person = check_people_length
      print 'Date: '
      date = gets.chomp

      new_rental = Rental.new(date, @books[book], @people[person])
      @rentals << new_rental
      puts 'Rental Created Successfully'
    end
  end

  def check_books_length
    if @books.length.zero?
      puts 'No Books Added Yet'
    else
      puts 'Select a book from the following list by number (not id)'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      book = gets.chomp.to_i
    end
    book
  end

  def check_people_length
    if @people.length.zero?
      puts 'No People Added Yet'
    else
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name} ID: #{person.id} Age: #{person.age}"
      end
      person = gets.chomp.to_i
    end
    person
  end

  def list_persoal_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @rentals.select { |rental| rental.person.id == id }.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
