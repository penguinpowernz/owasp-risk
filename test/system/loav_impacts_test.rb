require "application_system_test_case"

class LoavImpactsTest < ApplicationSystemTestCase
  setup do
    @loav_impact = loav_impacts(:one)
  end

  test "visiting the index" do
    visit loav_impacts_url
    assert_selector "h1", text: "Loav impacts"
  end

  test "should create loav impact" do
    visit loav_impacts_url
    click_on "New loav impact"

    fill_in "Name", with: @loav_impact.name
    fill_in "Score", with: @loav_impact.score
    click_on "Create Loav impact"

    assert_text "Loav impact was successfully created"
    click_on "Back"
  end

  test "should update Loav impact" do
    visit loav_impact_url(@loav_impact)
    click_on "Edit this loav impact", match: :first

    fill_in "Name", with: @loav_impact.name
    fill_in "Score", with: @loav_impact.score
    click_on "Update Loav impact"

    assert_text "Loav impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Loav impact" do
    visit loav_impact_url(@loav_impact)
    click_on "Destroy this loav impact", match: :first

    assert_text "Loav impact was successfully destroyed"
  end
end
