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

  test "dashboard <h1> changes dynamically when a category is selected" do
    assert_select "h1", "All Plants (#{@plants.count})"
    get root_path, params: { category: "Annual" }
    assert_select "h1", "Annual (#{@user.plants.joins(:categories).where(categories: { name: "Annual" }).count})"
  end

  test "reset button should clear category filter" do
    get root_path, params: { category: "Annual" }
    assert_select "h1", "Annual (#{@user.plants.joins(:categories).where(categories: { name: "Annual" }).count})"
    get root_path(category: "All Plants")
    assert_select "h1", "All Plants (#{@plants.count})"
  end

  test "no plants message should display when a user doesn't have any plants" do
    assert_select "p", "No plants found. Click the button below to add one." do
      @plants.destroy_all
      get root_path
    end
  end

  test "no plants message should display when an empty category is selected" do
  end

  test "plant cards should render properly" do
  end
end
