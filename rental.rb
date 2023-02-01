class Rental
  attr_accessor :date, :book, :person

  def initialize(date)
    @date = date
    @book = nil
    @person = nil
  end

  def book_person=(book, person)
    @book = book
    @person = person
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end
end
