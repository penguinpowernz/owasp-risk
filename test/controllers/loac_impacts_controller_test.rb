require "test_helper"

class LoacImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loac_impact = loac_impacts(:one)
  end

  test "should get index" do
    get loac_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_loac_impact_url
    assert_response :success
  end

  test "should create loac_impact" do
    assert_difference("LoacImpact.count") do
      post loac_impacts_url, params: { loac_impact: { name: @loac_impact.name, score: @loac_impact.score } }
    end

    assert_redirected_to loac_impact_url(LoacImpact.last)
  end

  test "should show loac_impact" do
    get loac_impact_url(@loac_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_loac_impact_url(@loac_impact)
    assert_response :success
  end

  test "should update loac_impact" do
    patch loac_impact_url(@loac_impact), params: { loac_impact: { name: @loac_impact.name, score: @loac_impact.score } }
    assert_redirected_to loac_impact_url(@loac_impact)
  end

  test "should destroy loac_impact" do
    assert_difference("LoacImpact.count", -1) do
      delete loac_impact_url(@loac_impact)
    end

    assert_redirected_to loac_impacts_url
  end
end
