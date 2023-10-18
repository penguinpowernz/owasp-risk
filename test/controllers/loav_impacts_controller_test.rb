require "test_helper"

class LoavImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loav_impact = loav_impacts(:one)
  end

  test "should get index" do
    get loav_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_loav_impact_url
    assert_response :success
  end

  test "should create loav_impact" do
    assert_difference("LoavImpact.count") do
      post loav_impacts_url, params: { loav_impact: { name: @loav_impact.name, score: @loav_impact.score } }
    end

    assert_redirected_to loav_impact_url(LoavImpact.last)
  end

  test "should show loav_impact" do
    get loav_impact_url(@loav_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_loav_impact_url(@loav_impact)
    assert_response :success
  end

  test "should update loav_impact" do
    patch loav_impact_url(@loav_impact), params: { loav_impact: { name: @loav_impact.name, score: @loav_impact.score } }
    assert_redirected_to loav_impact_url(@loav_impact)
  end

  test "should destroy loav_impact" do
    assert_difference("LoavImpact.count", -1) do
      delete loav_impact_url(@loav_impact)
    end

    assert_redirected_to loav_impacts_url
  end
end
