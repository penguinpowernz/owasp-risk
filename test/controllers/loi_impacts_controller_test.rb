require "test_helper"

class LoiImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loi_impact = loi_impacts(:one)
  end

  test "should get index" do
    get loi_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_loi_impact_url
    assert_response :success
  end

  test "should create loi_impact" do
    assert_difference("LoiImpact.count") do
      post loi_impacts_url, params: { loi_impact: { name: @loi_impact.name, score: @loi_impact.score } }
    end

    assert_redirected_to loi_impact_url(LoiImpact.last)
  end

  test "should show loi_impact" do
    get loi_impact_url(@loi_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_loi_impact_url(@loi_impact)
    assert_response :success
  end

  test "should update loi_impact" do
    patch loi_impact_url(@loi_impact), params: { loi_impact: { name: @loi_impact.name, score: @loi_impact.score } }
    assert_redirected_to loi_impact_url(@loi_impact)
  end

  test "should destroy loi_impact" do
    assert_difference("LoiImpact.count", -1) do
      delete loi_impact_url(@loi_impact)
    end

    assert_redirected_to loi_impacts_url
  end
end
