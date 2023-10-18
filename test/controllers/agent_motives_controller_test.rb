require "test_helper"

class AgentMotivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_motive = agent_motives(:one)
  end

  test "should get index" do
    get agent_motives_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_motive_url
    assert_response :success
  end

  test "should create agent_motive" do
    assert_difference("AgentMotive.count") do
      post agent_motives_url, params: { agent_motive: { name: @agent_motive.name, score: @agent_motive.score } }
    end

    assert_redirected_to agent_motive_url(AgentMotive.last)
  end

  test "should show agent_motive" do
    get agent_motive_url(@agent_motive)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_motive_url(@agent_motive)
    assert_response :success
  end

  test "should update agent_motive" do
    patch agent_motive_url(@agent_motive), params: { agent_motive: { name: @agent_motive.name, score: @agent_motive.score } }
    assert_redirected_to agent_motive_url(@agent_motive)
  end

  test "should destroy agent_motive" do
    assert_difference("AgentMotive.count", -1) do
      delete agent_motive_url(@agent_motive)
    end

    assert_redirected_to agent_motives_url
  end
end
