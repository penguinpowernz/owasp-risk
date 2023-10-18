require "application_system_test_case"

class RisksTest < ApplicationSystemTestCase
  setup do
    @risk = risks(:one)
  end

  test "visiting the index" do
    visit risks_url
    assert_selector "h1", text: "Risks"
  end

  test "should create risk" do
    visit risks_url
    click_on "New risk"

    fill_in "Business impact", with: @risk.business_impact_id
    fill_in "Desc", with: @risk.desc
    fill_in "Name", with: @risk.name
    fill_in "Technical impact", with: @risk.technical_impact_id
    fill_in "Threat agent", with: @risk.threat_agent_id
    fill_in "Vulnerability factor", with: @risk.vulnerability_factor_id
    click_on "Create Risk"

    assert_text "Risk was successfully created"
    click_on "Back"
  end

  test "should update Risk" do
    visit risk_url(@risk)
    click_on "Edit this risk", match: :first

    fill_in "Business impact", with: @risk.business_impact_id
    fill_in "Desc", with: @risk.desc
    fill_in "Name", with: @risk.name
    fill_in "Technical impact", with: @risk.technical_impact_id
    fill_in "Threat agent", with: @risk.threat_agent_id
    fill_in "Vulnerability factor", with: @risk.vulnerability_factor_id
    click_on "Update Risk"

    assert_text "Risk was successfully updated"
    click_on "Back"
  end

  test "should destroy Risk" do
    visit risk_url(@risk)
    click_on "Destroy this risk", match: :first

    assert_text "Risk was successfully destroyed"
  end
end
