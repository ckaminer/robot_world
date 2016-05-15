require_relative '../test_helper'

class UserSeesOneRobotTest < FeatureTest

  def test_user_sees_all_tasks
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})

    visit '/robots'
    click_link "Name1"

    assert_equal "/robots/#{robot_id1}", current_path
    assert page.has_content?("Name1")
  end

end
