require "test_helper"

class AuthorizationTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
  end

  test "sanity check" do
    assert @user.valid?
  end
end

class LoggedOutUsers < AuthorizationTest
  test "home page should be hero for users not logged in" do
    get root_path
    assert_select "h1", "Welcome to PlantSort"
    assert_select "a", "Log In"
  end

  test "users not logged in shouldn't be able to view settings" do
    get settings_path
    assert_redirected_to login_path
  end

  test "users not logged in shouldn't be able to view plants#new view" do
  get new_plant_path
  assert_redirected_to login_path
  end

  test "users not logged in shouldn't be able to view plants#edit view" do
  get edit_plant_path(1)
  assert_redirected_to login_path
  end
end

class LoggedInUsers < AuthorizationTest
  def setup
    super
    get login_path
    post session_path, params: { email_address: @user.email_address, password: "foobar" }
    assert_response :redirect
    assert_redirected_to root_path
    @second_user = users(:jane)
  end
  test "logged in users should be able to access home dashboard" do
    get root_path
    assert_select "title", "PlantSort"
    assert_select "p", "Logged in successfully."
    assert_select "h1", "All Plants (1)"
    assert_select "a", "Log Out"
  end

  test "logged in users should be able to access settings" do
    get settings_path
    assert_response :success
    assert_select "title", "Edit Account | PlantSort"
  end

  test "logged in users should be able to access new plant page" do
    get new_plant_path
    assert_response :success
    assert_select "title", "New Plant | PlantSort"
  end

  test "logged in users should be able to access edit plant page" do
    get edit_plant_path(1)
    assert_response :success
    assert_select "title", "Edit Plant | PlantSort"
  end

  test "logged in user cannot edit another user's plant" do
    get edit_plant_path(2)
    assert_response :missing
  end
end
