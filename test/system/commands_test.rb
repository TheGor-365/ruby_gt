require "application_system_test_case"

class CommandsTest < ApplicationSystemTestCase
  setup do
    @command = commands(:one)
  end

  test "visiting the index" do
    visit commands_url
    assert_selector "h1", text: "Commands"
  end

  test "should create command" do
    visit commands_url
    click_on "New command"

    fill_in "Body", with: @command.body
    fill_in "Description", with: @command.description
    fill_in "Language", with: @command.language_id
    fill_in "Overview", with: @command.overview
    fill_in "Path", with: @command.path
    fill_in "Title", with: @command.title
    click_on "Create Command"

    assert_text "Command was successfully created"
    click_on "Back"
  end

  test "should update Command" do
    visit command_url(@command)
    click_on "Edit this command", match: :first

    fill_in "Body", with: @command.body
    fill_in "Description", with: @command.description
    fill_in "Language", with: @command.language_id
    fill_in "Overview", with: @command.overview
    fill_in "Path", with: @command.path
    fill_in "Title", with: @command.title
    click_on "Update Command"

    assert_text "Command was successfully updated"
    click_on "Back"
  end

  test "should destroy Command" do
    visit command_url(@command)
    click_on "Destroy this command", match: :first

    assert_text "Command was successfully destroyed"
  end
end
