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
      password: "password",
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
      password: "password",
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
      password: "password",
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
      password: "password",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:email].empty?
  end

  test "invalid with password shorter than 6 characters" do
    user = User.new(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "passw",
      address: "1 World Street, London"
    )
    user.valid?
    assert_not user.errors[:password].empty?
  end

  test "invalid with no address" do
    user = User.new(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: ""
    )
    user.valid?
    assert_not user.errors[:address].empty?
  end

  test "invalid with address shorter than 10 characters" do
    user = User.new(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World"
    )
    user.valid?
    assert_not user.errors[:address].empty?
  end
end
