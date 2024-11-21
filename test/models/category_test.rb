require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
    @category = Category.new(name: "test", user_id: @user.id)
    assert @category.valid?
  end
  test "name must be present" do
    @category.name = nil
    assert_not @category.valid?
  end
end
