require './person'
require './student'
require './teacher'

# person

person = Person.new(15, parent_permission: false)
p person
p(person.can_use_services?)

person2 = Person.new(20, parent_permission: true)
p person2
p(person2.can_use_services?)

# student

student = Student.new(15, 'Bankai', name: 'Ichigo')
p(student)
p(student.can_use_services?)
p(student.validate_name)

# teacher

teacher = Teacher.new(40, 'Zampacto', name: 'Zangetsu')
p(teacher)
p(teacher.can_use_services?)

# validate name tests

# student

student = Student.new(15, 'Rasengan', name: 'naruto')
p(student)
p(student.can_use_services?)
p(student.validate_name)

# teacher

teacher = Teacher.new(40, 'Chidori', name: 'kakashi hatake')
p(teacher)
p(teacher.can_use_services?)
p(teacher.validate_name)
