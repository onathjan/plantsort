require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:john)
    @plant = plants(:one)
    @category = categories(:one)
    get login_path
    post session_path(email_address: @user.email_address, password: "foobar")
  end
  test "user should be able to create a new plant" do
    assert_difference "Plant.count", 1 do
      get new_plant_path
      assert_response :success
      post plants_path(@plant.id), params: { plant: { common_name: "Green Bean", user_id: @user.id, category_ids: [ @category.id ] } }
      assert_redirected_to root_url
    end
  end

  test "user should be able to edit a plant" do
    get edit_plant_path(@plant.id)
    assert_response :success
    patch plant_path(@plant.id), params: { plant: { common_name: "Something different", category_ids: [ @category.id ] } }
    assert_redirected_to root_path
    follow_redirect!
    assert_select "title", "PlantSort"
    @plant.reload
    assert_equal "Something different", @plant.common_name
  end

  test "user should be able to delete a plant" do
    assert_difference "Plant.count", -1 do
      delete plant_path(@plant.id)
      assert_redirected_to root_path
    end
  end
end
