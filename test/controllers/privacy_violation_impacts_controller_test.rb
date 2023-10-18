require "test_helper"

class PrivacyViolationImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @privacy_violation_impact = privacy_violation_impacts(:one)
  end

  test "should get index" do
    get privacy_violation_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_privacy_violation_impact_url
    assert_response :success
  end

  test "should create privacy_violation_impact" do
    assert_difference("PrivacyViolationImpact.count") do
      post privacy_violation_impacts_url, params: { privacy_violation_impact: { name: @privacy_violation_impact.name, score: @privacy_violation_impact.score } }
    end

    assert_redirected_to privacy_violation_impact_url(PrivacyViolationImpact.last)
  end

  test "should show privacy_violation_impact" do
    get privacy_violation_impact_url(@privacy_violation_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_privacy_violation_impact_url(@privacy_violation_impact)
    assert_response :success
  end

  test "should update privacy_violation_impact" do
    patch privacy_violation_impact_url(@privacy_violation_impact), params: { privacy_violation_impact: { name: @privacy_violation_impact.name, score: @privacy_violation_impact.score } }
    assert_redirected_to privacy_violation_impact_url(@privacy_violation_impact)
  end

  test "should destroy privacy_violation_impact" do
    assert_difference("PrivacyViolationImpact.count", -1) do
      delete privacy_violation_impact_url(@privacy_violation_impact)
    end

    assert_redirected_to privacy_violation_impacts_url
  end
end
