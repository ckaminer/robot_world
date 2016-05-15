require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_id = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})

    robot = robot_world.find(robot_id)
    assert_equal "Name1", robot.name
    assert_equal "City1", robot.city
    assert_equal robot_id, robot.id
  end

  def test_find_returns_correct_robot
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})
    robot_id2 = robot_world.create({name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "Birthdate2", date_hired: "DateHired2", department: "Department2"})

    robot = robot_world.find(robot_id2)

    assert_equal "Name2", robot.name
  end

  def test_all_returns_all_robots
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})
    robot_id2 = robot_world.create({name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "Birthdate2", date_hired: "DateHired2", department: "Department2"})
    robot_id3 = robot_world.create({name: "Name3", city: "City3", state: "State3", avatar: "Avatar3", birthdate: "Birthdate3", date_hired: "DateHired3", department: "Department3"})

    assert_equal 3, robot_world.all.length
    assert_equal robot_id1, robot_world.all[0].id
    assert_equal Robot, robot_world.all[1].class
  end

  def test_update_updates_given_robot
    robot_id = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})

    new_robot = {name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "Birthdate2", date_hired: "DateHired2", department: "Department2"}
    robot_world.update(robot_id,new_robot)

    assert_equal "Name2", robot_world.all[0].name
    assert_equal robot_id, robot_world.all[0].id
    assert_equal 1, robot_world.all.length
  end

  def test_destroy_removes_robot
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})
    robot_id2 = robot_world.create({name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "Birthdate2", date_hired: "DateHired2", department: "Department2"})

    robot_world.destroy(robot_id1)
    assert_equal 1, robot_world.all.length
    assert_equal robot_id2, robot_world.all[0].id
  end

  def test_average_age_calculated_correctly
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "1992-01-10", date_hired: "DateHired1", department: "Department1"})
    robot_id2 = robot_world.create({name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "1988-03-29", date_hired: "DateHired2", department: "Department2"})

    avg = robot_world.average_robot_age
    assert_equal 26, avg
  end
end
