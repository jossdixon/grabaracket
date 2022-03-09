require "application_system_test_case"

class RacketsTest < ApplicationSystemTestCase
  setup do
    @racket = rackets(:one)
  end

  test "visiting the index" do
    visit rackets_url
    assert_selector "h1", text: "Rackets"
  end

  test "creating a Racket" do
    visit rackets_url
    click_on "New Racket"

    fill_in "Brand", with: @racket.brand
    fill_in "Grip size", with: @racket.grip_size
    fill_in "Head size", with: @racket.head_size
    fill_in "Model", with: @racket.model
    fill_in "Weight", with: @racket.weight
    click_on "Create Racket"

    assert_text "Racket was successfully created"
    click_on "Back"
  end

  test "updating a Racket" do
    visit rackets_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @racket.brand
    fill_in "Grip size", with: @racket.grip_size
    fill_in "Head size", with: @racket.head_size
    fill_in "Model", with: @racket.model
    fill_in "Weight", with: @racket.weight
    click_on "Update Racket"

    assert_text "Racket was successfully updated"
    click_on "Back"
  end

  test "destroying a Racket" do
    visit rackets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Racket was successfully destroyed"
  end
end
