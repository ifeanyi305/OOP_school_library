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

  def run
    select_contents
  end

  def contents
    prompt = " Please chose an option for entering a number
      1 = List all books
      2 = List of people
      3 = Create a person
      4 = Create a book
      5 = Create a rental
      6 = List all rentals for a given person
      7 = Exit
      "
    puts prompt
  end

  def select_contents
    contents
    select = gets.chomp.to_i
    case select
    when 1
      list_books
    when 2
      list_people
    when 3
      choose_person
    when 4
      add_books
    when 5
      add_rental
    when 6
      list_rentals
    end
    puts 'Thanks for using this application'
  end

  def add_books
    id = @books.count + 1
    puts 'Enter book name:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    book = Book.new(id, title, author)
    @books << book
    puts "Book created with ID: #{book.id}"
    select_contents
  end

  def list_books
    @books.each do |book|
      puts "#{book.id} #{book.title}, #{book.author}"
    end
    select_contents
  end

  def choose_person
    puts 'do you want to create a student? (1) or a teacher (2)?'
    input = gets.chomp.to_i
    input == 1 ? add_student : 'wrong input'
    input == 2 ? add_teacher : 'wrong input'
  end

  def add_student
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp
    puts 'has parents permissions?'
    parent_permission = gets.chomp
    puts 'Enter student class'
    classroom = gets.chomp
    puts 'Enter student identity number'
    id = gets.chomp
    @people << Student.new(name, age, parent_permission, classroom, id)
    puts @people
    puts 'student created!'
    select_contents
  end

  def add_teacher
    puts 'Enter teacher name:'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp
    puts 'specialization'
    specialization = gets.chomp
    puts 'teacher identity number'
    id = gets.chomp
    @people << Teacher.new(name, age, specialization, id)
    puts @people
    puts 'teacher created!'
    select_contents
  end

  def list_people
    @people.each_with_index do |person, id|
      index = id
      index += 1
      puts "#{index} #{person.name}, #{person.age}years, id: #{person.id}"
    end
    select_contents
  end

  def add_rental
    puts 'select a books from the book list below'
    list_books
    book_id = gets.chomp.to_i
    puts "select a number from the list below: Not the person's ID"
    list_people
    person_id = gets.chomp.to_i
    puts 'Enter date of the book'
    date = gets.chomp
    id = @rentals.count + 1
    rental = Rental.new(id, date, book_id, person_id)
    @rentals << rental
    puts 'rentals created!'
    select_contents
  end

  def list_rentals
    puts 'number of person from the list'
    person_id = gets.chomp.to_i
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
    select_contents
  end

  def find_person(person_id)
    @people.find { |person| person.id == person_id }
  end
end
