require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({ :name => "Name1",
                        :city => "City1",
                        :state => "State1",
                        :avatar => "Avatar1",
                        :birthdate => "Birthdate1",
                        :date_hired => "DateHired1",
                        :department => "Department1",
                        :id => 1 })
    assert_equal "Name1", robot.name
    assert_equal "City1", robot.city
    assert_equal "State1", robot.state
    assert_equal "Avatar1", robot.avatar
    assert_equal "Birthdate1", robot.birthdate
    assert_equal "DateHired1", robot.date_hired
    assert_equal "Department1", robot.department
    assert_equal 1, robot.id
  end

  def test_age_is_calculated_correctly
    robot = Robot.new({ :name => "Name1",
                        :city => "City1",
                        :state => "State1",
                        :avatar => "Avatar1",
                        :birthdate => "1992-01-10",
                        :date_hired => "DateHired1",
                        :department => "Department1",
                        :id => 1 })
      assert_equal 24, robot.age
  end

end
