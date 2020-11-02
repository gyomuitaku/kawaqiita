require "application_system_test_case"

class TmpsTest < ApplicationSystemTestCase
  setup do
    @tmp = tmps(:one)
  end

  test "visiting the index" do
    visit tmps_url
    assert_selector "h1", text: "Tmps"
  end

  test "creating a Tmp" do
    visit tmps_url
    click_on "New Tmp"

    fill_in "Age", with: @tmp.age
    fill_in "Name", with: @tmp.name
    click_on "Create Tmp"

    assert_text "Tmp was successfully created"
    click_on "Back"
  end

  test "updating a Tmp" do
    visit tmps_url
    click_on "Edit", match: :first

    fill_in "Age", with: @tmp.age
    fill_in "Name", with: @tmp.name
    click_on "Update Tmp"

    assert_text "Tmp was successfully updated"
    click_on "Back"
  end

  test "destroying a Tmp" do
    visit tmps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tmp was successfully destroyed"
  end
end
