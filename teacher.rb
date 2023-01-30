class Teacher < Person
  attr_reader :specialization

  def initialize(specialization, id, _name = 'Unknown', age = nil, _parent_permission: true)
    super(id, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
