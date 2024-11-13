require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
    assert_select "title", "Sign Up | PlantSort"
  end
end
