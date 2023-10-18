require "test_helper"

class AgentOpportunitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_opportunity = agent_opportunities(:one)
  end

  test "should get index" do
    get agent_opportunities_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_opportunity_url
    assert_response :success
  end

  test "should create agent_opportunity" do
    assert_difference("AgentOpportunity.count") do
      post agent_opportunities_url, params: { agent_opportunity: { name: @agent_opportunity.name, score: @agent_opportunity.score } }
    end

    assert_redirected_to agent_opportunity_url(AgentOpportunity.last)
  end

  test "should show agent_opportunity" do
    get agent_opportunity_url(@agent_opportunity)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_opportunity_url(@agent_opportunity)
    assert_response :success
  end

  test "should update agent_opportunity" do
    patch agent_opportunity_url(@agent_opportunity), params: { agent_opportunity: { name: @agent_opportunity.name, score: @agent_opportunity.score } }
    assert_redirected_to agent_opportunity_url(@agent_opportunity)
  end

  test "should destroy agent_opportunity" do
    assert_difference("AgentOpportunity.count", -1) do
      delete agent_opportunity_url(@agent_opportunity)
    end

    assert_redirected_to agent_opportunities_url
  end
end
