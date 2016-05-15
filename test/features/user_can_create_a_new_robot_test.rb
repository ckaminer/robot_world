require_relative '../test_helper'

class UserCanCreateANewRobotTest < FeatureTest

  def test_user_creates_robot
    visit '/'

    click_link "Conceive New Robot"

    assert_equal '/robots/new', current_path

    fill_in 'robot[name]', with: "Robot 1"
    fill_in 'robot[city]', with: "Denver"

    click_button "create robot"

    assert page.has_content?("Robot 1")
  end

end
