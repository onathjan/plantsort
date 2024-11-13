require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "test")
    assert @category.valid?
  end
  test "name must be present" do
    @category.name = nil
    assert_not @category.valid?
  end
end
