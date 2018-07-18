class Student
  attr_accessor :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT,
    album TEXT
    )")
  end 

  def self.drop_table 
    sql = <<- SQL 
      DROP TABLE students;
      SQL 
      DB[:conn].execute(sql)
    end 
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

end
