require 'test_helper'

class RacketsControllerTest < ActionDispatch::IntegrationTest
  test "redirected if not signed in" do
    get rackets_url
    assert_response :redirect
  end

  test "signed in user can get index" do
    sign_in users(:test)
    get rackets_url
    assert_response :success
  end

  # setup do
  #   @racket = rackets(:one)
  # end

  # test "should get index" do
  #   get rackets_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_racket_url
  #   assert_response :success
  # end

  # test "should create racket" do
  #   assert_difference('Racket.count') do
  #     post rackets_url, params: { racket: { brand: @racket.brand, grip_size: @racket.grip_size, head_size: @racket.head_size, model: @racket.model, weight: @racket.weight } }
  #   end

  #   assert_redirected_to racket_url(Racket.last)
  # end

  # test "should show racket" do
  #   get racket_url(@racket)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_racket_url(@racket)
  #   assert_response :success
  # end

  # test "should update racket" do
  #   patch racket_url(@racket), params: { racket: { brand: @racket.brand, grip_size: @racket.grip_size, head_size: @racket.head_size, model: @racket.model, weight: @racket.weight } }
  #   assert_redirected_to racket_url(@racket)
  # end

  # test "should destroy racket" do
  #   assert_difference('Racket.count', -1) do
  #     delete racket_url(@racket)
  #   end

  #   assert_redirected_to rackets_url
  # end
end
