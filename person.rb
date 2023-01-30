class Person
  attr_accessor :id, :name, :age

  def initialize(id, name = 'Unknown', age = nil, parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission >= 18
  end
end
