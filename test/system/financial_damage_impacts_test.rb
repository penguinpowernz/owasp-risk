require "application_system_test_case"

class FinancialDamageImpactsTest < ApplicationSystemTestCase
  setup do
    @financial_damage_impact = financial_damage_impacts(:one)
  end

  test "visiting the index" do
    visit financial_damage_impacts_url
    assert_selector "h1", text: "Financial damage impacts"
  end

  test "should create financial damage impact" do
    visit financial_damage_impacts_url
    click_on "New financial damage impact"

    fill_in "Name", with: @financial_damage_impact.name
    fill_in "Score", with: @financial_damage_impact.score
    click_on "Create Financial damage impact"

    assert_text "Financial damage impact was successfully created"
    click_on "Back"
  end

  test "should update Financial damage impact" do
    visit financial_damage_impact_url(@financial_damage_impact)
    click_on "Edit this financial damage impact", match: :first

    fill_in "Name", with: @financial_damage_impact.name
    fill_in "Score", with: @financial_damage_impact.score
    click_on "Update Financial damage impact"

    assert_text "Financial damage impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Financial damage impact" do
    visit financial_damage_impact_url(@financial_damage_impact)
    click_on "Destroy this financial damage impact", match: :first

    assert_text "Financial damage impact was successfully destroyed"
  end
end
