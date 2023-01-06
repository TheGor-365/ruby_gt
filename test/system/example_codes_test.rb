require "application_system_test_case"

class ExampleCodesTest < ApplicationSystemTestCase
  setup do
    @example_code = example_codes(:one)
  end

  test "visiting the index" do
    visit example_codes_url
    assert_selector "h1", text: "Example codes"
  end

  test "should create example code" do
    visit example_codes_url
    click_on "New example code"

    fill_in "Code", with: @example_code.code
    fill_in "Description", with: @example_code.description
    fill_in "Example", with: @example_code.example_id
    fill_in "Lang", with: @example_code.lang_id
    fill_in "Overview", with: @example_code.overview
    fill_in "Path", with: @example_code.path
    fill_in "Title", with: @example_code.title
    click_on "Create Example code"

    assert_text "Example code was successfully created"
    click_on "Back"
  end

  test "should update Example code" do
    visit example_code_url(@example_code)
    click_on "Edit this example code", match: :first

    fill_in "Code", with: @example_code.code
    fill_in "Description", with: @example_code.description
    fill_in "Example", with: @example_code.example_id
    fill_in "Lang", with: @example_code.lang_id
    fill_in "Overview", with: @example_code.overview
    fill_in "Path", with: @example_code.path
    fill_in "Title", with: @example_code.title
    click_on "Update Example code"

    assert_text "Example code was successfully updated"
    click_on "Back"
  end

  test "should destroy Example code" do
    visit example_code_url(@example_code)
    click_on "Destroy this example code", match: :first

    assert_text "Example code was successfully destroyed"
  end
end
