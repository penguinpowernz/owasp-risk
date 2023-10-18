require "application_system_test_case"

class AgentOpportunitiesTest < ApplicationSystemTestCase
  setup do
    @agent_opportunity = agent_opportunities(:one)
  end

  test "visiting the index" do
    visit agent_opportunities_url
    assert_selector "h1", text: "Agent opportunities"
  end

  test "should create agent opportunity" do
    visit agent_opportunities_url
    click_on "New agent opportunity"

    fill_in "Name", with: @agent_opportunity.name
    fill_in "Score", with: @agent_opportunity.score
    click_on "Create Agent opportunity"

    assert_text "Agent opportunity was successfully created"
    click_on "Back"
  end

  test "should update Agent opportunity" do
    visit agent_opportunity_url(@agent_opportunity)
    click_on "Edit this agent opportunity", match: :first

    fill_in "Name", with: @agent_opportunity.name
    fill_in "Score", with: @agent_opportunity.score
    click_on "Update Agent opportunity"

    assert_text "Agent opportunity was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent opportunity" do
    visit agent_opportunity_url(@agent_opportunity)
    click_on "Destroy this agent opportunity", match: :first

    assert_text "Agent opportunity was successfully destroyed"
  end
end
