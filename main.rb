require './app'
def welcome
  puts 'Welcome to our school library'
end

def create_book(app)
  puts 'Enter book name:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  app.add_books(title, author)
  puts 'Book created!'
  select_contents(app)
end

def book_list(app)
  app.list_books
  select_contents(app)
end

def people_list(app)
  app.list_people
  select_contents(app)
end

def choose_person(app)
  puts 'do you want to create a student? (1) or a teacher (2)?'
  input = gets.chomp.to_i
  input == 1 ? create_student(app) : 'wrong input'
  input == 2 ? create_teacher(app) : 'wrong input'
end

def create_student(app)
  puts 'Enter student name:'
  name = gets.chomp
  puts 'Enter student age:'
  age = gets.chomp
  puts 'Enter student classroom:'
  classroom = gets.chomp
  puts 'Enter student identity number'
  id = gets.chomp
  puts 'has parents permissions?'
  parent_permission = gets.chomp
  app.add_student(name, age, parent_permission, classroom, id)
  puts 'student created!'
  select_contents(app)
end

def create_teacher(app)
  puts 'Enter teacher name:'
  name = gets.chomp
  puts 'Enter teacher age:'
  age = gets.chomp
  puts 'specialization'
  specialization = gets.chomp
  puts 'teacher identity number'
  id = gets.chomp
  app.add_teacher(name, age, specialization, id)
  puts 'teacher created!'
  select_contents(app)
end

def create_rentals(app)
  puts 'select a books from the book list below'
  app.list_books
  book_id = gets.chomp.to_i
  puts "select a number from the list below: Not the person's ID"
  app.list_people
  person_id = gets.chomp.to_i
  puts 'Enter date of the book'
  date = gets.chomp
  app.add_rental(date, book_id - 1, person_id)
  puts 'rentals created!'
  select_contents(app)
end

def rental_list(app)
  puts 'number of person from the list'
  person_id = gets.chomp.to_i
  app.list_rentals(person_id)
  select_contents(app)
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

def select_contents(app)
  contents
  select = gets.chomp.to_i
  case select
  when 1
    book_list(app)
  when 2
    people_list(app)
  when 3
    choose_person(app)
  when 4
    create_book(app)
  when 5
    create_rentals(app)
  when 6
    rental_list(app)
  end
  puts 'Thanks for using this application'
end

def main
  app = App.new
  select_contents(app)
end
welcome
main
