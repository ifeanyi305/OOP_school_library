require './person'
class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, id, _parent_permission: true)
    super(id, age)
    @specialization = specialization
    @name = name
    @id = id
    @age = age
  end

  def can_use_services?
    true
  end
end
