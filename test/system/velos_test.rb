require "application_system_test_case"

class VelosTest < ApplicationSystemTestCase
  setup do
    @velo = velos(:one)
  end

  test "visiting the index" do
    visit velos_url
    assert_selector "h1", text: "Velos"
  end

  test "should create velo" do
    visit velos_url
    click_on "New velo"

    fill_in "City", with: @velo.city
    fill_in "Company", with: @velo.company
    fill_in "Country", with: @velo.country
    fill_in "Latitude", with: @velo.latitude
    fill_in "Longitude", with: @velo.longitude
    fill_in "Name", with: @velo.name
    click_on "Create Velo"

    assert_text "Velo was successfully created"
    click_on "Back"
  end

  test "should update Velo" do
    visit velo_url(@velo)
    click_on "Edit this velo", match: :first

    fill_in "City", with: @velo.city
    fill_in "Company", with: @velo.company
    fill_in "Country", with: @velo.country
    fill_in "Latitude", with: @velo.latitude
    fill_in "Longitude", with: @velo.longitude
    fill_in "Name", with: @velo.name
    click_on "Update Velo"

    assert_text "Velo was successfully updated"
    click_on "Back"
  end

  test "should destroy Velo" do
    visit velo_url(@velo)
    click_on "Destroy this velo", match: :first

    assert_text "Velo was successfully destroyed"
  end
end
