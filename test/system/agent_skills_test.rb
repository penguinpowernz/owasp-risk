require "application_system_test_case"

class AgentSkillsTest < ApplicationSystemTestCase
  setup do
    @agent_skill = agent_skills(:one)
  end

  test "visiting the index" do
    visit agent_skills_url
    assert_selector "h1", text: "Agent skills"
  end

  test "should create agent skill" do
    visit agent_skills_url
    click_on "New agent skill"

    fill_in "Name", with: @agent_skill.name
    fill_in "Score", with: @agent_skill.score
    click_on "Create Agent skill"

    assert_text "Agent skill was successfully created"
    click_on "Back"
  end

  test "should update Agent skill" do
    visit agent_skill_url(@agent_skill)
    click_on "Edit this agent skill", match: :first

    fill_in "Name", with: @agent_skill.name
    fill_in "Score", with: @agent_skill.score
    click_on "Update Agent skill"

    assert_text "Agent skill was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent skill" do
    visit agent_skill_url(@agent_skill)
    click_on "Destroy this agent skill", match: :first

    assert_text "Agent skill was successfully destroyed"
  end
end
