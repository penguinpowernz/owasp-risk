require "application_system_test_case"

class PrivacyViolationImpactsTest < ApplicationSystemTestCase
  setup do
    @privacy_violation_impact = privacy_violation_impacts(:one)
  end

  test "visiting the index" do
    visit privacy_violation_impacts_url
    assert_selector "h1", text: "Privacy violation impacts"
  end

  test "should create privacy violation impact" do
    visit privacy_violation_impacts_url
    click_on "New privacy violation impact"

    fill_in "Name", with: @privacy_violation_impact.name
    fill_in "Score", with: @privacy_violation_impact.score
    click_on "Create Privacy violation impact"

    assert_text "Privacy violation impact was successfully created"
    click_on "Back"
  end

  test "should update Privacy violation impact" do
    visit privacy_violation_impact_url(@privacy_violation_impact)
    click_on "Edit this privacy violation impact", match: :first

    fill_in "Name", with: @privacy_violation_impact.name
    fill_in "Score", with: @privacy_violation_impact.score
    click_on "Update Privacy violation impact"

    assert_text "Privacy violation impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Privacy violation impact" do
    visit privacy_violation_impact_url(@privacy_violation_impact)
    click_on "Destroy this privacy violation impact", match: :first

    assert_text "Privacy violation impact was successfully destroyed"
  end
end
