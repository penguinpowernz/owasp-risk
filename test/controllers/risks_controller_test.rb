require "test_helper"

class RisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @risk = risks(:one)
  end

  test "should get index" do
    get risks_url
    assert_response :success
  end

  test "should get new" do
    get new_risk_url
    assert_response :success
  end

  test "should create risk" do
    assert_difference("Risk.count") do
      post risks_url, params: { risk: { business_impact_id: @risk.business_impact_id, desc: @risk.desc, name: @risk.name, technical_impact_id: @risk.technical_impact_id, threat_agent_id: @risk.threat_agent_id, vulnerability_factor_id: @risk.vulnerability_factor_id } }
    end

    assert_redirected_to risk_url(Risk.last)
  end

  test "should show risk" do
    get risk_url(@risk)
    assert_response :success
  end

  test "should get edit" do
    get edit_risk_url(@risk)
    assert_response :success
  end

  test "should update risk" do
    patch risk_url(@risk), params: { risk: { business_impact_id: @risk.business_impact_id, desc: @risk.desc, name: @risk.name, technical_impact_id: @risk.technical_impact_id, threat_agent_id: @risk.threat_agent_id, vulnerability_factor_id: @risk.vulnerability_factor_id } }
    assert_redirected_to risk_url(@risk)
  end

  test "should destroy risk" do
    assert_difference("Risk.count", -1) do
      delete risk_url(@risk)
    end

    assert_redirected_to risks_url
  end
end
