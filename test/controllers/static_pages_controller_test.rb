require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "PlantSort"
  end

  test "should get terms of use" do
    get terms_of_use_path
    assert_response :success
    assert_select "title", "Terms of Use | PlantSort"
  end

  test "should get privacy policy" do
    get privacy_policy_path
    assert_response :success
    assert_select "title", "Privacy Policy | PlantSort"
  end

  test "should get password reset" do
    get password_reset_path
    assert_response :success
    assert_select "title", "Password Reset | PlantSort"
  end
end
