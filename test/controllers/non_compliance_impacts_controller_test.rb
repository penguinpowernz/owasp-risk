require "test_helper"

class NonComplianceImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @non_compliance_impact = non_compliance_impacts(:one)
  end

  test "should get index" do
    get non_compliance_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_non_compliance_impact_url
    assert_response :success
  end

  test "should create non_compliance_impact" do
    assert_difference("NonComplianceImpact.count") do
      post non_compliance_impacts_url, params: { non_compliance_impact: { name: @non_compliance_impact.name, score: @non_compliance_impact.score } }
    end

    assert_redirected_to non_compliance_impact_url(NonComplianceImpact.last)
  end

  test "should show non_compliance_impact" do
    get non_compliance_impact_url(@non_compliance_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_non_compliance_impact_url(@non_compliance_impact)
    assert_response :success
  end

  test "should update non_compliance_impact" do
    patch non_compliance_impact_url(@non_compliance_impact), params: { non_compliance_impact: { name: @non_compliance_impact.name, score: @non_compliance_impact.score } }
    assert_redirected_to non_compliance_impact_url(@non_compliance_impact)
  end

  test "should destroy non_compliance_impact" do
    assert_difference("NonComplianceImpact.count", -1) do
      delete non_compliance_impact_url(@non_compliance_impact)
    end

    assert_redirected_to non_compliance_impacts_url
  end
end
