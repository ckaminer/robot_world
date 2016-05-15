require_relative '../test_helper'

class UserEditsRobotTest < FeatureTest

  def test_user_sees_all_tasks
    robot_id1 = robot_world.create({name: "Name1", city: "City1", state: "State1", avatar: "Avatar1", birthdate: "Birthdate1", date_hired: "DateHired1", department: "Department1"})

    visit "/robots"
    click_link "Edit"

    assert_equal "/robots/#{robot_id1}/edit", current_path

    fill_in 'robot[name]', with: "New Name"
    click_button "submit changes"

    assert_equal "/robots/#{robot_id1}", current_path
    assert page.has_content?("Name: New Name")
  end

end
