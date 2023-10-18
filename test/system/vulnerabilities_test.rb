require "application_system_test_case"

class VulnerabilitiesTest < ApplicationSystemTestCase
  setup do
    @vulnerability = vulnerabilities(:one)
  end

  test "visiting the index" do
    visit vulnerabilities_url
    assert_selector "h1", text: "Vulnerabilities"
  end

  test "should create vulnerability" do
    visit vulnerabilities_url
    click_on "New vulnerability"

    fill_in "Desc", with: @vulnerability.desc
    fill_in "Name", with: @vulnerability.name
    fill_in "Project", with: @vulnerability.project_id
    click_on "Create Vulnerability"

    assert_text "Vulnerability was successfully created"
    click_on "Back"
  end

  test "should update Vulnerability" do
    visit vulnerability_url(@vulnerability)
    click_on "Edit this vulnerability", match: :first

    fill_in "Desc", with: @vulnerability.desc
    fill_in "Name", with: @vulnerability.name
    fill_in "Project", with: @vulnerability.project_id
    click_on "Update Vulnerability"

    assert_text "Vulnerability was successfully updated"
    click_on "Back"
  end

  test "should destroy Vulnerability" do
    visit vulnerability_url(@vulnerability)
    click_on "Destroy this vulnerability", match: :first

    assert_text "Vulnerability was successfully destroyed"
  end
end
