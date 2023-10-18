require "test_helper"

class FinancialDamageImpactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_damage_impact = financial_damage_impacts(:one)
  end

  test "should get index" do
    get financial_damage_impacts_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_damage_impact_url
    assert_response :success
  end

  test "should create financial_damage_impact" do
    assert_difference("FinancialDamageImpact.count") do
      post financial_damage_impacts_url, params: { financial_damage_impact: { name: @financial_damage_impact.name, score: @financial_damage_impact.score } }
    end

    assert_redirected_to financial_damage_impact_url(FinancialDamageImpact.last)
  end

  test "should show financial_damage_impact" do
    get financial_damage_impact_url(@financial_damage_impact)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_damage_impact_url(@financial_damage_impact)
    assert_response :success
  end

  test "should update financial_damage_impact" do
    patch financial_damage_impact_url(@financial_damage_impact), params: { financial_damage_impact: { name: @financial_damage_impact.name, score: @financial_damage_impact.score } }
    assert_redirected_to financial_damage_impact_url(@financial_damage_impact)
  end

  test "should destroy financial_damage_impact" do
    assert_difference("FinancialDamageImpact.count", -1) do
      delete financial_damage_impact_url(@financial_damage_impact)
    end

    assert_redirected_to financial_damage_impacts_url
  end
end
