require "test_helper"

class PlantTest < ActiveSupport::TestCase
  def setup
    @plant = Plant.new(name: "Dandelion", user_id: 1, category_ids: [ 1 ])
    assert @plant.valid?
  end

  test "should be valid" do
    assert @plant.valid?
  end

  test "shouldn't be valid without name" do
    @plant.name = nil
    assert_not @plant.valid?
  end

  test "name can't be too long" do
    @plant.name = "a" * 26
    assert_not @plant.valid?
  end

  test "shouldn't be valid without category ids" do
    @plant.category_ids = nil
    assert_not @plant.valid?
  end
end
