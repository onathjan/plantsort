require "test_helper"

class SessionsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
  end

  test "should get login path" do
    get login_path
    assert_response :success
    assert_select "title", "Log In | PlantSort"
    assert_select "h1", "Log In"
  end
end

class InvalidCredentialsTest < SessionsTest
  test "should reject invalid password" do
    post session_path, params: { email_address: @user.email_address, password: "invalid" }

    assert_nil Current.user
    assert_response :redirect
    assert_redirected_to new_session_path
    follow_redirect!
    assert_select "title", "Log In | PlantSort"
    assert_select "h1", "Log In"
  end

  test "should reject invalid email" do
    post session_path, params: { email_address: "invalid@example.com", password: @user.password_digest }

    assert_response :redirect
    assert_redirected_to new_session_path
    follow_redirect!
    assert_select "title", "Log In | PlantSort"
    assert_select "h1", "Log In"
    assert_select "p", "Login information is incorrect. Please try again."
  end
end

class ValidCredentialsTest < SessionsTest
  test "should log in with valid credentials" do
    post session_path, params: { email_address: @user.email_address, password: "foobar" }

    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Logged in successfully."
  end
end

class LogoutTest < SessionsTest
  test "should logout user" do
    post session_path, params: { email_address: @user.email_address, password: "foobar" }

    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Logged in successfully."

    delete session_path
    assert_response :redirect
    assert_redirected_to new_session_path
    follow_redirect!
    assert_select "title", "Log In | PlantSort"
    assert_select "p", "Logged out successfully."
  end
end
