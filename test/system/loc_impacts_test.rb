require "application_system_test_case"

class LocImpactsTest < ApplicationSystemTestCase
  setup do
    @loc_impact = loc_impacts(:one)
  end

  test "visiting the index" do
    visit loc_impacts_url
    assert_selector "h1", text: "Loc impacts"
  end

  test "should create loc impact" do
    visit loc_impacts_url
    click_on "New loc impact"

    fill_in "Name", with: @loc_impact.name
    fill_in "Score", with: @loc_impact.score
    click_on "Create Loc impact"

    assert_text "Loc impact was successfully created"
    click_on "Back"
  end

  test "should update Loc impact" do
    visit loc_impact_url(@loc_impact)
    click_on "Edit this loc impact", match: :first

    fill_in "Name", with: @loc_impact.name
    fill_in "Score", with: @loc_impact.score
    click_on "Update Loc impact"

    assert_text "Loc impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Loc impact" do
    visit loc_impact_url(@loc_impact)
    click_on "Destroy this loc impact", match: :first

    assert_text "Loc impact was successfully destroyed"
  end
end
