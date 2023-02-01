require './nameable'
class Person < Nameable
  attr_accessor :id, :name, :age, :rentals

  def initialize(id, name = 'Unknown', age = nil, parent_permission: true)
    super(id, name, age, parent_permission)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission >= 18
  end

  def correct_name
    name
  end
end
