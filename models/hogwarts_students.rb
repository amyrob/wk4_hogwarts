require_relative('../db/sql_runner')

class Student

  attr_reader :id, :first_name, :last_name, :house, :age

  def initialize (options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house, age)
    VALUES ($1, $2, $3, $4)
    RETURNING *;"

    values = [@first_name, @last_name, @house, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Student.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

  def Student.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run(sql)
    result = students.map { |student|Student.new(student)}
    return result
  end

  def Student.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

end #end of class
