require "application_system_test_case"

class AgentSizesTest < ApplicationSystemTestCase
  setup do
    @agent_size = agent_sizes(:one)
  end

  test "visiting the index" do
    visit agent_sizes_url
    assert_selector "h1", text: "Agent sizes"
  end

  test "should create agent size" do
    visit agent_sizes_url
    click_on "New agent size"

    fill_in "Name", with: @agent_size.name
    fill_in "Score", with: @agent_size.score
    click_on "Create Agent size"

    assert_text "Agent size was successfully created"
    click_on "Back"
  end

  test "should update Agent size" do
    visit agent_size_url(@agent_size)
    click_on "Edit this agent size", match: :first

    fill_in "Name", with: @agent_size.name
    fill_in "Score", with: @agent_size.score
    click_on "Update Agent size"

    assert_text "Agent size was successfully updated"
    click_on "Back"
  end

  test "should destroy Agent size" do
    visit agent_size_url(@agent_size)
    click_on "Destroy this agent size", match: :first

    assert_text "Agent size was successfully destroyed"
  end
end
