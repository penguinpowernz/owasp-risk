require "application_system_test_case"

class ReputationDamageImpactsTest < ApplicationSystemTestCase
  setup do
    @reputation_damage_impact = reputation_damage_impacts(:one)
  end

  test "visiting the index" do
    visit reputation_damage_impacts_url
    assert_selector "h1", text: "Reputation damage impacts"
  end

  test "should create reputation damage impact" do
    visit reputation_damage_impacts_url
    click_on "New reputation damage impact"

    fill_in "Name", with: @reputation_damage_impact.name
    fill_in "Score", with: @reputation_damage_impact.score
    click_on "Create Reputation damage impact"

    assert_text "Reputation damage impact was successfully created"
    click_on "Back"
  end

  test "should update Reputation damage impact" do
    visit reputation_damage_impact_url(@reputation_damage_impact)
    click_on "Edit this reputation damage impact", match: :first

    fill_in "Name", with: @reputation_damage_impact.name
    fill_in "Score", with: @reputation_damage_impact.score
    click_on "Update Reputation damage impact"

    assert_text "Reputation damage impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Reputation damage impact" do
    visit reputation_damage_impact_url(@reputation_damage_impact)
    click_on "Destroy this reputation damage impact", match: :first

    assert_text "Reputation damage impact was successfully destroyed"
  end
end
