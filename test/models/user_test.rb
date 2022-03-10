require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "invalid without a first name" do
    user = User.new(
      first_name: "",
      last_name: "Smith",
      email: "hello@mail.com",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:first_name].empty?
  end

  test "invalid with first name shorter than two characters" do
    user = User.new(
      first_name: "J",
      last_name: "Smith",
      email: "hello@mail.com",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:first_name].empty?
  end

  test "invalid without last name" do
    user = User.new(
      first_name: "John",
      last_name: "",
      email: "hello@mail.com",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:last_name].empty?
  end

  test "invalid with last name shorter than two characters" do
    user = User.new(
      first_name: "John",
      last_name: "S",
      email: "hello@mail.com",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:last_name].empty?
  end

  test "invalid with invalid email" do
    user = User.new(
      first_name: "John",
      last_name: "Smith",
      email: "hello.com",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:email].empty?
  end
end
