require_relative '../test_helper'

class UserDeletesRobotTest < FeatureTest

  def test_user_sees_all_tasks
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})

    visit "/robots"

    assert page.has_content?("#{robot_id1}: Name1")
    click_button "delete"

    refute page.has_content?("#{robot_id1}: Name1")
  end

end
