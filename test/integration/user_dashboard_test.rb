require "test_helper"

class UserDashboardTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
    @categories = Category.all
    @plants = Plant.where(user_id: @user.id)
    post session_path, params: { email_address: @user.email_address, password: "foobar" }
    follow_redirect!
  end

  test "categories should be displayed" do
    @categories.each do |category|
      assert_select "p", category.name
    end
  end

  test "Add Plant button should be present" do
    assert_select "a", "Add Plant"
  end

  test "Add Plant button should work" do
    assert_select "a.button", text: "Add Plant", href: new_plant_path
    get new_plant_path
    assert_response :success
  end

  test "Reset button shouldn't be default when dashboard returns all plants" do
    assert_select "h1", "All Plants (#{@plants.count})"
    assert_select "a", text: "Reset", count: 0
    get root_path, params: { category: "Annual" }
    assert_select "a", text: "Reset"
  end
end
