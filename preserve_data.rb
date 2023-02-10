require 'json'
#write
def store_books(books)
  File.write('books.json', JSON.pretty_generate(books.map { |book| { id: book.id, title: book.title, author: book.author } }))
end

def store_people(people)
  File.write('people.json', JSON.pretty_generate(people.map { |person| 
    if person.instance_of?(Student)
      {name: person.name, age: person.age, parent_permission: person.parent_permission, classroom: person.classroom, id: person.id}
    elsif person.instance_of?(Teacher)
      {name: person.name, age: person.age, specialization: person.specialization, id: person.id}
    end
  }))
end

def store_rental(rentals)
  File.write('rental.json', JSON.pretty_generate(rentals.map { |rental| 
    {id: rental.id, date: rental.date, book_id: rental.book_id, person_id: rental.person_id}
  } ))
end

#read

def get_books
  return if File.zero?('books.json') || File.exist?('books.json') == false
  books = JSON.parse(File.read('books.json')).map do |book| 
   Book.new(book['id'], book['title'], book['author'])
  end
  return books
end

def get_people
  return unless File.exist?('people.json')
  people = JSON.parse(File.read('people.json'))
  return if people.empty?
  people_array = []
  people.each do |person|
    if person['specialization']
      people_array << Teacher.new(person['name'], person['age'], person['specialization'], person['id'])
    else
      people_array << Student.new(person['name'], person['age'], person['parent_permission'], person['classroom'], person['id'])
    end
  end
  people_array
end
