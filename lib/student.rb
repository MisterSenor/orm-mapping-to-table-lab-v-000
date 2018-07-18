class Student
  attr_accessor :name, :grade, :id

  def initialize(name, grade)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    grade INTEGER
    )")
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE students
      SQL
      DB[:conn].execute(sql)
    end
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  def save
    #remember that this is an instance method
    sql = <<-SQL
    INSERT INTO students (name, grade) VALUES (?,?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

end
