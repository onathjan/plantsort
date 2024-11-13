require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "user shouldn't be able to sign up with invalid information" do
    assert_no_difference "User.count" do
      post registrations_path, params: { user: { email_address: "no", password: "no" } }
    end
  end
  test "user should be able to sign up with valid information" do
    assert_difference "User.count", 1 do
      post registrations_path, params: { user: { email_address: "user@example.com", password: "foobar" } }
    end
  end
end

class UserEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(email_address: "user@example.com", password: "foobar")
    assert @user.valid?
    @user.save!
    post session_path, params: { email_address: @user.email_address, password: "foobar" }
    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Logged in successfully."
  end
  test "should update email address" do
    get settings_path
    assert_response :success

    patch registrations_path, params: { user: { email_address: "newemail@example.com", password: "foobar" } }

    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Account settings updated successfully."
  end

  test "should update password" do
    get settings_path
    assert_response :success

    patch registrations_path, params: { user: { email_address: "user@example.com", password: "foobaz" } }

    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Account settings updated successfully."
  end

  test "should update email address without password" do
    get settings_path
    assert_response :success

    patch registrations_path, params: { user: { email_address: "newemail@example.com" } }

    assert_response :redirect
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    assert_select "p", "Account settings updated successfully."
  end

  test "shouldn't update password without email" do
    get settings_path
    assert_response :success

    patch registrations_path, params: { user: { email_address: "", password: "foobaz" } }

    assert_response :unprocessable_entity
    assert_select "title", "Edit Account | PlantSort"
    assert_select "p", "This form contains 3 errors:"
  end
end

class UserDeleteTest < UserEditTest
 def setup
   super
 end
  test "should delete user account" do
    assert_difference "User.count", -1 do
      delete registrations_path
    end
  end
end
