require "application_system_test_case"

class ThreatAgentsTest < ApplicationSystemTestCase
  setup do
    @threat_agent = threat_agents(:one)
  end

  test "visiting the index" do
    visit threat_agents_url
    assert_selector "h1", text: "Threat agents"
  end

  test "should create threat agent" do
    visit threat_agents_url
    click_on "New threat agent"

    fill_in "Desc", with: @threat_agent.desc
    fill_in "Motive", with: @threat_agent.motive_id
    fill_in "Name", with: @threat_agent.name
    fill_in "Opportunity", with: @threat_agent.opportunity_id
    fill_in "Size", with: @threat_agent.size_id
    fill_in "Skill", with: @threat_agent.skill_id
    click_on "Create Threat agent"

    assert_text "Threat agent was successfully created"
    click_on "Back"
  end

  test "should update Threat agent" do
    visit threat_agent_url(@threat_agent)
    click_on "Edit this threat agent", match: :first

    fill_in "Desc", with: @threat_agent.desc
    fill_in "Motive", with: @threat_agent.motive_id
    fill_in "Name", with: @threat_agent.name
    fill_in "Opportunity", with: @threat_agent.opportunity_id
    fill_in "Size", with: @threat_agent.size_id
    fill_in "Skill", with: @threat_agent.skill_id
    click_on "Update Threat agent"

    assert_text "Threat agent was successfully updated"
    click_on "Back"
  end

  test "should destroy Threat agent" do
    visit threat_agent_url(@threat_agent)
    click_on "Destroy this threat agent", match: :first

    assert_text "Threat agent was successfully destroyed"
  end
end
