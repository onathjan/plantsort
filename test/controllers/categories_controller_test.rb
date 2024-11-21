require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
    @category = categories(:one)
    get login_path
    post session_path(email_address: @user.email_address, password: "foobar")
  end

  test "should return index page" do
    get categories_path
    assert_response :success
  end

  test "should be able to create new category" do
    assert_difference "Category.count", 1 do
      get new_category_path
      post categories_path(category: { name: "Test category" })
      assert_redirected_to root_path
      follow_redirect!
      assert_select "title", "PlantSort"
    end
  end

  test "should be able to update a category" do
    get edit_category_path(@category.id)
    assert_response :success
    patch category_path(@category.id), params: { category: { name: "Something different" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    @category.reload
    assert_equal "Something different", @category.name
  end

  test "should be able to delete a category" do
    assert_difference "Category.count", -1 do
      delete category_path(@category.id)
      assert_redirected_to root_path
    end
  end
end
