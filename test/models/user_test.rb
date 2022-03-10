require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has a first name" do
    user = User.new(
      first_name: "",
      last_name: "Smith",
      email: "hello@mail.com",
      address: "1 World Street, London"
    )
    assert user.valid?
  end
end
