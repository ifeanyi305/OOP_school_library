class Classroom
  attr_accessor :label, :student

  def initialize(label)
    @label = label
    @student = []
  end

  def add_label(students)
    @student << students
    students.classroom = self
  end
end
