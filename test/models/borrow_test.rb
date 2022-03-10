require 'test_helper'

class BorrowTest < ActiveSupport::TestCase
  test "invalid without start date" do
    first_user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    second_user = User.create!(
      first_name: "Peter",
      last_name: "Parker",
      email: "hellohello@mail.com",
      password: "password",
      address: "2 World Street, London"
    )
    racket = Racket.create!(
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 98,
      user: first_user
    )
    borrow = Borrow.new(
      user: second_user,
      racket: racket,
      start_date: "",
      end_date: "2022-02-02",
      status: 0
    )
    borrow.valid?
    assert_not borrow.errors[:start_date].empty?
  end

  test "invalid without end date" do
    first_user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    second_user = User.create!(
      first_name: "Peter",
      last_name: "Parker",
      email: "hellohello@mail.com",
      password: "password",
      address: "2 World Street, London"
    )
    racket = Racket.create!(
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      user: first_user,
      head_size: 98
    )
    borrow = Borrow.new(
      user: second_user,
      racket: racket,
      start_date: "2022-01-01",
      end_date: "",
      status: 0
    )
    borrow.valid?
    assert_not borrow.errors[:end_date].empty?
  end
end
