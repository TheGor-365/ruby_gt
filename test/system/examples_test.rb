require "application_system_test_case"

class ExamplesTest < ApplicationSystemTestCase
  setup do
    @example = examples(:one)
  end

  test "visiting the index" do
    visit examples_url
    assert_selector "h1", text: "Examples"
  end

  test "should create example" do
    visit examples_url
    click_on "New example"

    fill_in "Body", with: @example.body
    fill_in "Description", with: @example.description
    fill_in "Language", with: @example.language_id
    fill_in "Overview", with: @example.overview
    fill_in "Path", with: @example.path
    fill_in "Title", with: @example.title
    click_on "Create Example"

    assert_text "Example was successfully created"
    click_on "Back"
  end

  test "should update Example" do
    visit example_url(@example)
    click_on "Edit this example", match: :first

    fill_in "Body", with: @example.body
    fill_in "Description", with: @example.description
    fill_in "Language", with: @example.language_id
    fill_in "Overview", with: @example.overview
    fill_in "Path", with: @example.path
    fill_in "Title", with: @example.title
    click_on "Update Example"

    assert_text "Example was successfully updated"
    click_on "Back"
  end

  test "should destroy Example" do
    visit example_url(@example)
    click_on "Destroy this example", match: :first

    assert_text "Example was successfully destroyed"
  end
end
