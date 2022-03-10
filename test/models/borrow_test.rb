require 'test_helper'

class BorrowTest < ActiveSupport::TestCase
  test "invalid without start date" do
    borrow = Borrow.new(
      start_date: "",
      end_date: "2022-02-02",
      status: 0
    )
    borrow.valid?
    assert_not borrow.errors[:start_date].empty?
  end

  test "invalid without end date" do
    borrow = Borrow.new(
      start_date: "2022-01-01",
      end_date: "",
      status: 0
    )
    borrow.valid?
    assert_not borrow.errors[:end_date].empty?
  end
end
