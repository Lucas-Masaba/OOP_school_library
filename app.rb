class App
  attr_reader :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def await_user_input
    gets.chomp
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
    choice = await_user_input

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
    print 'Age: '
    age = await_user_input
    print 'Classroom:'
    classroom = await_user_input
    print 'Name: '
    name = await_user_input
    print 'Has parent permission? [Y/N]: '
    permission = await_user_input

    student = Student.new(age, classroom, name: name, parent_permission: permission == 'Y')
    @people << student
  end

  def create_teacher
    print 'Age: '
    age = await_user_input
    print 'Specialization:'
    specialization = await_user_input
    print 'Name: '
    name = await_user_input

    teacher = Teacher.new(age, specialization, name: name)
    @people << teacher
  end

  def create_a_book
    print 'Title: '
    title = await_user_input
    print 'Author: '
    author = await_user_input

    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
  end

  def create_a_rental
    check_books_length

    check_people_length

    if @books.length.zero? && @people.length.zero?
      puts 'No books and people :('
    else
      print 'Date: '
      date = await_user_input

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
      book = await_user_input.to_i
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
      person = await_user_input.to_i
    end
    person
  end

  def list_persoal_rentals
    print 'ID of person: '
    id = await_user_input.to_i
    @rentals.select { |rental| rental.person.id == id }.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def cases(answer)
    case answer
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_persoal_rentals
    else
      puts 'Thank you for using this app :)'
    end
  end

  def run
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

      answer = await_user_input.to_i
      cases(answer)
      break if answer == 7
    end
  end
end
