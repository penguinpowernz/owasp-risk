require "application_system_test_case"

class NonComplianceImpactsTest < ApplicationSystemTestCase
  setup do
    @non_compliance_impact = non_compliance_impacts(:one)
  end

  test "visiting the index" do
    visit non_compliance_impacts_url
    assert_selector "h1", text: "Non compliance impacts"
  end

  test "should create non compliance impact" do
    visit non_compliance_impacts_url
    click_on "New non compliance impact"

    fill_in "Name", with: @non_compliance_impact.name
    fill_in "Score", with: @non_compliance_impact.score
    click_on "Create Non compliance impact"

    assert_text "Non compliance impact was successfully created"
    click_on "Back"
  end

  test "should update Non compliance impact" do
    visit non_compliance_impact_url(@non_compliance_impact)
    click_on "Edit this non compliance impact", match: :first

    fill_in "Name", with: @non_compliance_impact.name
    fill_in "Score", with: @non_compliance_impact.score
    click_on "Update Non compliance impact"

    assert_text "Non compliance impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Non compliance impact" do
    visit non_compliance_impact_url(@non_compliance_impact)
    click_on "Destroy this non compliance impact", match: :first

    assert_text "Non compliance impact was successfully destroyed"
  end
end
