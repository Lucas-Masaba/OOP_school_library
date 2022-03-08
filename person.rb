require 'json'
require './corrector'
require './rental'

class Person
  attr_accessor :name, :age
  attr_reader :rentals, :id, :parent_permission

  def initialize(age, name: 'Unknown', parent_permission: true, id: nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals.push(rental)
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    (@age >= 18 || @parent_permission == true)
  end

  def self.path
    './data/people.json'
  end

  def self.read_people
    people_arr = []
    if File.exist?(Person.path)
      JSON.parse(File.read(Person.path))['students'].each do |obj|
        s = Student.new(obj['age'], obj['classroom'], name: obj['name'], parent_permission: obj['parent_permission'],
                                                      id: obj['id'])
        people_arr << s
      end
      JSON.parse(File.read(Person.path))['teachers'].each do |obj|
        people_arr << Teacher.new(obj['age'], obj['specialization'], name: obj['name'], id: obj['id'])
      end
    end
    people_arr
  end

  def self.save_data(people)
    people_data = {
      students: [],
      teachers: []
    }
    people.each do |person|
      if person.instance_of?(Student)
        people_data[:students] << { id: person.id, age: person.age, classroom: person.classroom, name: person.name,
                                    parent_permission: person.parent_permission }
      else
        people_data[:teachers] << { id: person.id, age: person.age, specialization: person.specialization,
                                    name: person.name }
      end
    end
    File.write(Person.path, JSON.generate(people_data))
  end
end
