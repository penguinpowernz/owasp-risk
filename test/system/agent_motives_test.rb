require "application_system_test_case"

class AgentMotivesTest < ApplicationSystemTestCase
  setup do
    @agent_motive = agent_motives(:one)
  end

  test "visiting the index" do
    visit agent_motives_url
    assert_selector "h1", text: "Agent motives"
  end

  test "should create agent motive" do
    visit agent_motives_url
    click_on "New agent motive"

    fill_in "Name", with: @agent_motive.name
    fill_in "Score", with: @agent_motive.score
    click_on "Create Agent motive"

    assert_text "Agent motive was successfully created"
    click_on "Back"
  end

  test "should update Agent motive" do
    visit agent_motive_url(@agent_motive)
    click_on "Edit this agent motive", match: :first

    fill_in "Name", with: @agent_motive.name
    fill_in "Score", with: @agent_motive.score
    click_on "Update Agent motive"

    assert_text "Agent motive was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent motive" do
    visit agent_motive_url(@agent_motive)
    click_on "Destroy this agent motive", match: :first

    assert_text "Agent motive was successfully destroyed"
  end
end
