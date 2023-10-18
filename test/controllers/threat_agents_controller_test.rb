require "test_helper"

class ThreatAgentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @threat_agent = threat_agents(:one)
  end

  test "should get index" do
    get threat_agents_url
    assert_response :success
  end

  test "should get new" do
    get new_threat_agent_url
    assert_response :success
  end

  test "should create threat_agent" do
    assert_difference("ThreatAgent.count") do
      post threat_agents_url, params: { threat_agent: { desc: @threat_agent.desc, motive_id: @threat_agent.motive_id, name: @threat_agent.name, opportunity_id: @threat_agent.opportunity_id, size_id: @threat_agent.size_id, skill_id: @threat_agent.skill_id } }
    end

    assert_redirected_to threat_agent_url(ThreatAgent.last)
  end

  test "should show threat_agent" do
    get threat_agent_url(@threat_agent)
    assert_response :success
  end

  test "should get edit" do
    get edit_threat_agent_url(@threat_agent)
    assert_response :success
  end

  test "should update threat_agent" do
    patch threat_agent_url(@threat_agent), params: { threat_agent: { desc: @threat_agent.desc, motive_id: @threat_agent.motive_id, name: @threat_agent.name, opportunity_id: @threat_agent.opportunity_id, size_id: @threat_agent.size_id, skill_id: @threat_agent.skill_id } }
    assert_redirected_to threat_agent_url(@threat_agent)
  end

  test "should destroy threat_agent" do
    assert_difference("ThreatAgent.count", -1) do
      delete threat_agent_url(@threat_agent)
    end

    assert_redirected_to threat_agents_url
  end
end
