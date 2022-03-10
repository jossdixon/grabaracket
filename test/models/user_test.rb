require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has first name" do
    assert_equal "John", users(:test_user).first_name
  end

  test "can update first name" do
    users(:test_user).update(first_name: "Mike")
    assert_equal "Mike", users(:test_user).first_name
  end
end
