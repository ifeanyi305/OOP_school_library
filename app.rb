require './book'
require './student'
require './teacher'
require './rental'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def add_books(title, author)
    id = @books.count + 1
    book = Book.new(id, title, author)
    @books << book
    puts "Book created with ID: #{book.id}"
  end

  def list_books
    @books.each do |book|
      puts "#{book.id} #{book.title}, #{book.author}"
    end
  end

  def add_student(name, age, parent_permission, classroom, id)
    @people << Student.new(name, age, parent_permission, classroom, id)
    puts @people
  end

  def add_teacher(name, age, specialization, id)
    @people << Teacher.new(name, age, specialization, id)
    puts @people
  end

  def list_people
    @people.each_with_index do |person, id|
      index = id
      index += 1
      puts "#{index} #{person.name}, #{person.age}years, id: #{person.id}"
    end
  end

  def add_rental(date, book_id, person_id)
    id = @rentals.count + 1
    rental = Rental.new(id, date, book_id, person_id)
    @rentals << rental
  end

  def list_rentals(person_id)
    rentals_for_person = @rentals.select { |rental| rental.person_id == person_id }
    p @rentals
    if rentals_for_person.empty?
      puts "No rentals found for person with ID: #{person_id}"
    else
      puts "Listing rentals for person with ID: #{person_id}"
      rentals_for_person.each do |rental|
        book_lab = @books.find { |book| book.id == rental.id }
        puts "ID:#{rental.id} Book: #{book_lab.title} Author: #{book_lab.author} Date: #{rental.date}"
      end
    end
  end

  def find_person(person_id)
    @people.find { |person| person.id == person_id }
  end
end
