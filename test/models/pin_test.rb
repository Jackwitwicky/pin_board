require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @pin = Pin.new(title: "Test Pin", description: "This is a pin description with content.")
  end

  test "should be valid" do
    assert @pin.valid?
  end

  test "title should not be blank" do
    @pin.title = "  "
    assert_not @pin.valid?
  end

  test "description should not be blank" do
    @pin.description = "  "
    assert_not @pin.valid?
  end

  test "title should not be too long" do
    @pin.title = "a" * 31
    assert_not @pin.valid?
  end

end
