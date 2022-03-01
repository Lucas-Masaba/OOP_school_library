require './person'
require './student'
require './teacher'

#person

person = Person.new(15, false)
p person
p(person.can_use_services?)

person2 = Person.new(20, true)
p person2
p(person2.can_use_services?)

#student

teacher = Student.new(15, 'Bankai', name = 'Ichigo')
p(teacher)
p(teacher.can_use_services?)

#teacher

teacher = Teacher.new(40, 'Zampacto', name = 'Zangetsu')
p(teacher)
p(teacher.can_use_services?)