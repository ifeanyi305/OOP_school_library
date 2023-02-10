require './person'
class Student < Person
  attr_reader :classroom, :name, :age, :parent_permission, :id

  def initialize(name, age, parent_permission, classroom, id)
    super(id, age, name, parent_permission)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @classroom = classroom
    @id = id
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student << self unless classroom.student.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
