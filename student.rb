require './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, id, _name = 'Unknown', age = nil, _parent_permission: true)
    super(id, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
