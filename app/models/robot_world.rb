class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    table.insert(name: robot[:name],
                 city: robot[:city],
                 state: robot[:state],
                 avatar: robot[:avatar],
                 birthdate: robot[:birthdate],
                 date_hired: robot[:date_hired],
                 department: robot[:department])
  end

  def all
    table.to_a.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    locate_robot(id).to_a.first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    locate_robot(id).update(robot)
  end

  def destroy(id)
    locate_robot(id).delete
  end

  def delete_all
    table.delete
  end

  def table
    database.from(:robots).order(:id)
  end

  def locate_robot(id)
    table.where(:id => id)
  end

  def average_robot_age
    age_array = robots.all.map do |robot|
      robot.age
    end
    age_array.reduce(:+) / age_array.length
  end

end
