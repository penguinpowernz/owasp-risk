require "test_helper"

class AgentSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agent_size = agent_sizes(:one)
  end

  test "should get index" do
    get agent_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_agent_size_url
    assert_response :success
  end

  test "should create agent_size" do
    assert_difference("AgentSize.count") do
      post agent_sizes_url, params: { agent_size: { name: @agent_size.name, score: @agent_size.score } }
    end

    assert_redirected_to agent_size_url(AgentSize.last)
  end

  test "should show agent_size" do
    get agent_size_url(@agent_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_agent_size_url(@agent_size)
    assert_response :success
  end

  test "should update agent_size" do
    patch agent_size_url(@agent_size), params: { agent_size: { name: @agent_size.name, score: @agent_size.score } }
    assert_redirected_to agent_size_url(@agent_size)
  end

  test "should destroy agent_size" do
    assert_difference("AgentSize.count", -1) do
      delete agent_size_url(@agent_size)
    end

    assert_redirected_to agent_sizes_url
  end
end
