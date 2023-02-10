require './book'
require './person'
class Rental
  attr_accessor :date, :book, :person, :person_id, :book_id, :id

  def initialize(id, date, book_id, person_id)
    @date = date
    @book_id = book_id
    @person_id = person_id
    @id = id
    @rentals = []
  end

  def book_person(book, person)
    @book = book
    @person = person
    book.rentals << self unless book.rentals.include?(self)
    person.rentals << self unless person.rentals.include?(self)
  end
end
