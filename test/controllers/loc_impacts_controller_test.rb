require "test_helper"

class LocImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loc_impact = loc_impacts(:one)
  end

  test "should get index" do
    get loc_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_loc_impact_url
    assert_response :success
  end

  test "should create loc_impact" do
    assert_difference("LocImpact.count") do
      post loc_impacts_url, params: { loc_impact: { name: @loc_impact.name, score: @loc_impact.score } }
    end

    assert_redirected_to loc_impact_url(LocImpact.last)
  end

  test "should show loc_impact" do
    get loc_impact_url(@loc_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_loc_impact_url(@loc_impact)
    assert_response :success
  end

  test "should update loc_impact" do
    patch loc_impact_url(@loc_impact), params: { loc_impact: { name: @loc_impact.name, score: @loc_impact.score } }
    assert_redirected_to loc_impact_url(@loc_impact)
  end

  test "should destroy loc_impact" do
    assert_difference("LocImpact.count", -1) do
      delete loc_impact_url(@loc_impact)
    end

    assert_redirected_to loc_impacts_url
  end
end
