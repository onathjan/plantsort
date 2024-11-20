require "test_helper"

class PlantTest < ActiveSupport::TestCase
  def setup
    @plant = Plant.new(common_name: "Tomato", user_id: 1, category_ids: [ 1 ])
    assert @plant.valid?
  end

  test "should be valid" do
    assert @plant.valid?
  end

  test "shouldn't be valid without common name" do
    @plant.common_name = nil
    assert_not @plant.valid?
  end

  test "should be valid without taxonomic name" do
    @plant.taxonomic_name = nil
    assert @plant.valid?
  end

  test "common name can't be too long" do
    @plant.common_name = "a" * 26
    assert_not @plant.valid?
  end

  test "taxonomic name can't be too long" do
    @plant.common_name = "a" * 41
    assert_not @plant.valid?
  end

  test "shouldn't be valid without category ids" do
    @plant.category_ids = nil
    assert_not @plant.valid?
  end
end
