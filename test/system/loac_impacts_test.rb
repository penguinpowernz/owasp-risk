require "application_system_test_case"

class LoacImpactsTest < ApplicationSystemTestCase
  setup do
    @loac_impact = loac_impacts(:one)
  end

  test "visiting the index" do
    visit loac_impacts_url
    assert_selector "h1", text: "Loac impacts"
  end

  test "should create loac impact" do
    visit loac_impacts_url
    click_on "New loac impact"

    fill_in "Name", with: @loac_impact.name
    fill_in "Score", with: @loac_impact.score
    click_on "Create Loac impact"

    assert_text "Loac impact was successfully created"
    click_on "Back"
  end

  test "should update Loac impact" do
    visit loac_impact_url(@loac_impact)
    click_on "Edit this loac impact", match: :first

    fill_in "Name", with: @loac_impact.name
    fill_in "Score", with: @loac_impact.score
    click_on "Update Loac impact"

    assert_text "Loac impact was successfully updated"
    click_on "Back"
  end

  test "should destroy Loac impact" do
    visit loac_impact_url(@loac_impact)
    click_on "Destroy this loac impact", match: :first

    assert_text "Loac impact was successfully destroyed"
  end
end
