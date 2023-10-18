require "application_system_test_case"

class LoiImpactsTest < ApplicationSystemTestCase
  setup do
    @loi_impact = loi_impacts(:one)
  end

  test "visiting the index" do
    visit loi_impacts_url
    assert_selector "h1", text: "Loi impacts"
  end

  test "should create loi impact" do
    visit loi_impacts_url
    click_on "New loi impact"

    fill_in "Name", with: @loi_impact.name
    fill_in "Score", with: @loi_impact.score
    click_on "Create Loi impact"

    assert_text "Loi impact was successfully created"
    click_on "Back"
  end

  test "should update Loi impact" do
    visit loi_impact_url(@loi_impact)
    click_on "Edit this loi impact", match: :first

    fill_in "Name", with: @loi_impact.name
    fill_in "Score", with: @loi_impact.score
    click_on "Update Loi impact"

    assert_text "Loi impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Loi impact" do
    visit loi_impact_url(@loi_impact)
    click_on "Destroy this loi impact", match: :first

    assert_text "Loi impact was successfully destroyed"
  end
end
