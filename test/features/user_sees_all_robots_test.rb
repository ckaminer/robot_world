require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest

  def test_user_sees_all_tasks
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})
    robot_id2 = robot_world.create({name: "Name2", city: "City2", state: "State2", avatar: "Avatar2", birthdate: "Birthdate2", date_hired: "DateHired2", department: "Department2"})

    visit '/robots'

    assert page.has_content?("#{robot_id1}:")
    assert page.has_content?("Name1")
    assert page.has_content?("Name2")
  end

end
