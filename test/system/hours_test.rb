require "application_system_test_case"

class HoursTest < ApplicationSystemTestCase
  setup do
    @hour = hours(:one)
  end

  test "visiting the index" do
    visit hours_url
    assert_selector "h1", text: "Hours"
  end

  test "creating a Hour" do
    visit hours_url
    click_on "New Hour"

    fill_in "Amount", with: @hour.amount
    fill_in "Name", with: @hour.name
    fill_in "User", with: @hour.user_id
    click_on "Create Hour"

    assert_text "Hour was successfully created"
    click_on "Back"
  end

  test "updating a Hour" do
    visit hours_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @hour.amount
    fill_in "Name", with: @hour.name
    fill_in "User", with: @hour.user_id
    click_on "Update Hour"

    assert_text "Hour was successfully updated"
    click_on "Back"
  end

  test "destroying a Hour" do
    visit hours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hour was successfully destroyed"
  end
end
