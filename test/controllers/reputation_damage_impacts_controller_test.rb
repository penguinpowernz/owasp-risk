require "test_helper"

class ReputationDamageImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reputation_damage_impact = reputation_damage_impacts(:one)
  end

  test "should get index" do
    get reputation_damage_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_reputation_damage_impact_url
    assert_response :success
  end

  test "should create reputation_damage_impact" do
    assert_difference("ReputationDamageImpact.count") do
      post reputation_damage_impacts_url, params: { reputation_damage_impact: { name: @reputation_damage_impact.name, score: @reputation_damage_impact.score } }
    end

    assert_redirected_to reputation_damage_impact_url(ReputationDamageImpact.last)
  end

  test "should show reputation_damage_impact" do
    get reputation_damage_impact_url(@reputation_damage_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_reputation_damage_impact_url(@reputation_damage_impact)
    assert_response :success
  end

  test "should update reputation_damage_impact" do
    patch reputation_damage_impact_url(@reputation_damage_impact), params: { reputation_damage_impact: { name: @reputation_damage_impact.name, score: @reputation_damage_impact.score } }
    assert_redirected_to reputation_damage_impact_url(@reputation_damage_impact)
  end

  test "should destroy reputation_damage_impact" do
    assert_difference("ReputationDamageImpact.count", -1) do
      delete reputation_damage_impact_url(@reputation_damage_impact)
    end

    assert_redirected_to reputation_damage_impacts_url
  end
end
