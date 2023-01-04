require "application_system_test_case"

class SnippetCodesTest < ApplicationSystemTestCase
  setup do
    @snippet_code = snippet_codes(:one)
  end

  test "visiting the index" do
    visit snippet_codes_url
    assert_selector "h1", text: "Snippet codes"
  end

  test "should create snippet code" do
    visit snippet_codes_url
    click_on "New snippet code"

    fill_in "Code", with: @snippet_code.code
    fill_in "Description", with: @snippet_code.description
    fill_in "Lang", with: @snippet_code.lang_id
    fill_in "Overview", with: @snippet_code.overview
    fill_in "Path", with: @snippet_code.path
    fill_in "Snippet", with: @snippet_code.snippet_id
    click_on "Create Snippet code"

    assert_text "Snippet code was successfully created"
    click_on "Back"
  end

  test "should update Snippet code" do
    visit snippet_code_url(@snippet_code)
    click_on "Edit this snippet code", match: :first

    fill_in "Code", with: @snippet_code.code
    fill_in "Description", with: @snippet_code.description
    fill_in "Lang", with: @snippet_code.lang_id
    fill_in "Overview", with: @snippet_code.overview
    fill_in "Path", with: @snippet_code.path
    fill_in "Snippet", with: @snippet_code.snippet_id
    click_on "Update Snippet code"

    assert_text "Snippet code was successfully updated"
    click_on "Back"
  end

  test "should destroy Snippet code" do
    visit snippet_code_url(@snippet_code)
    click_on "Destroy this snippet code", match: :first

    assert_text "Snippet code was successfully destroyed"
  end
end
