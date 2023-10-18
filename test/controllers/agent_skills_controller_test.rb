require "test_helper"

class AgentSkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_skill = agent_skills(:one)
  end

  test "should get index" do
    get agent_skills_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_skill_url
    assert_response :success
  end

  test "should create agent_skill" do
    assert_difference("AgentSkill.count") do
      post agent_skills_url, params: { agent_skill: { name: @agent_skill.name, score: @agent_skill.score } }
    end

    assert_redirected_to agent_skill_url(AgentSkill.last)
  end

  test "should show agent_skill" do
    get agent_skill_url(@agent_skill)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_skill_url(@agent_skill)
    assert_response :success
  end

  test "should update agent_skill" do
    patch agent_skill_url(@agent_skill), params: { agent_skill: { name: @agent_skill.name, score: @agent_skill.score } }
    assert_redirected_to agent_skill_url(@agent_skill)
  end

  test "should destroy agent_skill" do
    assert_difference("AgentSkill.count", -1) do
      delete agent_skill_url(@agent_skill)
    end

    assert_redirected_to agent_skills_url
  end
end
