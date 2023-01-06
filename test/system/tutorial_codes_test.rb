require "application_system_test_case"

class TutorialCodesTest < ApplicationSystemTestCase
  setup do
    @tutorial_code = tutorial_codes(:one)
  end

  test "visiting the index" do
    visit tutorial_codes_url
    assert_selector "h1", text: "Tutorial codes"
  end

  test "should create tutorial code" do
    visit tutorial_codes_url
    click_on "New tutorial code"

    fill_in "Code", with: @tutorial_code.code
    fill_in "Description", with: @tutorial_code.description
    fill_in "Lang", with: @tutorial_code.lang_id
    fill_in "Overview", with: @tutorial_code.overview
    fill_in "Path", with: @tutorial_code.path
    fill_in "Title", with: @tutorial_code.title
    fill_in "Tutorial", with: @tutorial_code.tutorial_id
    click_on "Create Tutorial code"

    assert_text "Tutorial code was successfully created"
    click_on "Back"
  end

  test "should update Tutorial code" do
    visit tutorial_code_url(@tutorial_code)
    click_on "Edit this tutorial code", match: :first

    fill_in "Code", with: @tutorial_code.code
    fill_in "Description", with: @tutorial_code.description
    fill_in "Lang", with: @tutorial_code.lang_id
    fill_in "Overview", with: @tutorial_code.overview
    fill_in "Path", with: @tutorial_code.path
    fill_in "Title", with: @tutorial_code.title
    fill_in "Tutorial", with: @tutorial_code.tutorial_id
    click_on "Update Tutorial code"

    assert_text "Tutorial code was successfully updated"
    click_on "Back"
  end

  test "should destroy Tutorial code" do
    visit tutorial_code_url(@tutorial_code)
    click_on "Destroy this tutorial code", match: :first

    assert_text "Tutorial code was successfully destroyed"
  end
end
