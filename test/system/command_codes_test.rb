require "application_system_test_case"

class CommandCodesTest < ApplicationSystemTestCase
  setup do
    @command_code = command_codes(:one)
  end

  test "visiting the index" do
    visit command_codes_url
    assert_selector "h1", text: "Command codes"
  end

  test "should create command code" do
    visit command_codes_url
    click_on "New command code"

    fill_in "Body", with: @command_code.body
    fill_in "Description", with: @command_code.description
    fill_in "Lang", with: @command_code.lang_id
    fill_in "Overview", with: @command_code.overview
    fill_in "Path", with: @command_code.path
    fill_in "Title", with: @command_code.title
    click_on "Create Command code"

    assert_text "Command code was successfully created"
    click_on "Back"
  end

  test "should update Command code" do
    visit command_code_url(@command_code)
    click_on "Edit this command code", match: :first

    fill_in "Body", with: @command_code.body
    fill_in "Description", with: @command_code.description
    fill_in "Lang", with: @command_code.lang_id
    fill_in "Overview", with: @command_code.overview
    fill_in "Path", with: @command_code.path
    fill_in "Title", with: @command_code.title
    click_on "Update Command code"

    assert_text "Command code was successfully updated"
    click_on "Back"
  end

  test "should destroy Command code" do
    visit command_code_url(@command_code)
    click_on "Destroy this command code", match: :first

    assert_text "Command code was successfully destroyed"
  end
end
