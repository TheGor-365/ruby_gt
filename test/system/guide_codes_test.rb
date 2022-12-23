require "application_system_test_case"

class GuideCodesTest < ApplicationSystemTestCase
  setup do
    @guide_code = guide_codes(:one)
  end

  test "visiting the index" do
    visit guide_codes_url
    assert_selector "h1", text: "Guide codes"
  end

  test "should create guide code" do
    visit guide_codes_url
    click_on "New guide code"

    click_on "Create Guide code"

    assert_text "Guide code was successfully created"
    click_on "Back"
  end

  test "should update Guide code" do
    visit guide_code_url(@guide_code)
    click_on "Edit this guide code", match: :first

    click_on "Update Guide code"

    assert_text "Guide code was successfully updated"
    click_on "Back"
  end

  test "should destroy Guide code" do
    visit guide_code_url(@guide_code)
    click_on "Destroy this guide code", match: :first

    assert_text "Guide code was successfully destroyed"
  end
end
