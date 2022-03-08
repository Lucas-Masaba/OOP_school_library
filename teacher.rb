require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name: 'Unknown', parent_permission: true, id: nil)
    super(age, name: name, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
