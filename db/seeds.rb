require_relative('../models/hogwarts_students')

Student.delete_all()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Griffyndor",
  "age" => 10
  })

  student2 = Student.new({
    "first_name" => "Hermione",
    "last_name" => "Granger",
    "house" => "Griffyndor",
    "age" => 10
    })

student1.save()
student2.save()
