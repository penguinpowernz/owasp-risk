require "test_helper"

class VulnerabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vulnerability = vulnerabilities(:one)
  end

  test "should get index" do
    get vulnerabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_vulnerability_url
    assert_response :success
  end

  test "should create vulnerability" do
    assert_difference("Vulnerability.count") do
      post vulnerabilities_url, params: { vulnerability: { desc: @vulnerability.desc, name: @vulnerability.name, project_id: @vulnerability.project_id } }
    end

    assert_redirected_to vulnerability_url(Vulnerability.last)
  end

  test "should show vulnerability" do
    get vulnerability_url(@vulnerability)
    assert_response :success
  end

  test "should get edit" do
    get edit_vulnerability_url(@vulnerability)
    assert_response :success
  end

  test "should update vulnerability" do
    patch vulnerability_url(@vulnerability), params: { vulnerability: { desc: @vulnerability.desc, name: @vulnerability.name, project_id: @vulnerability.project_id } }
    assert_redirected_to vulnerability_url(@vulnerability)
  end

  test "should destroy vulnerability" do
    assert_difference("Vulnerability.count", -1) do
      delete vulnerability_url(@vulnerability)
    end

    assert_redirected_to vulnerabilities_url
  end
end
