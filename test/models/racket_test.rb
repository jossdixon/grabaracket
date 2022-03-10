require 'test_helper'

class RacketTest < ActiveSupport::TestCase
  test "invalid without brand" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:brand].empty?
  end

  test "invalid with brand shorter than three characters" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wi",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:brand].empty?
  end

  test "invalid with brand longer than ten characters" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilsonwilsonwilsonwilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:brand].empty?
  end

  test "invalid without model" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "",
      grip_size: "L1",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:model].empty?
  end

  test "invalid with model shorter than three characters" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ul",
      grip_size: "L1",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:model].empty?
  end

  test "invalid with no grip size" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "",
      weight: 285,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:grip_size].empty?
  end

  test "invalid with no weight" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: "",
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:weight].empty?
  end

  test "invalid with weight too low" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 100,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:weight].empty?
  end

  test "invalid with weight too high" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 450,
      head_size: 98
    )
    racket.valid?
    assert_not racket.errors[:weight].empty?
  end

  test "invalid without head size" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: ""
    )
    racket.valid?
    assert_not racket.errors[:head_size].empty?
  end

  test "invalid with head size too small" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 75
    )
    racket.valid?
    assert_not racket.errors[:head_size].empty?
  end

  test "invalid with head size too large" do
    user = User.create!(
      first_name: "John",
      last_name: "Smith",
      email: "hello@mail.com",
      password: "password",
      address: "1 World Street, London"
    )
    racket = Racket.new(
      user: user,
      brand: "Wilson",
      model: "Ultra",
      grip_size: "L1",
      weight: 285,
      head_size: 140
    )
    racket.valid?
    assert_not racket.errors[:head_size].empty?
  end
end
