require "application_system_test_case"

class TemplateCodesTest < ApplicationSystemTestCase
  setup do
    @template_code = template_codes(:one)
  end

  test "visiting the index" do
    visit template_codes_url
    assert_selector "h1", text: "Template codes"
  end

  test "should create template code" do
    visit template_codes_url
    click_on "New template code"

    fill_in "Code", with: @template_code.code
    fill_in "Description", with: @template_code.description
    fill_in "Example", with: @template_code.example_id
    fill_in "Lang", with: @template_code.lang_id
    fill_in "Overview", with: @template_code.overview
    fill_in "Path", with: @template_code.path
    fill_in "Title", with: @template_code.title
    click_on "Create Template code"

    assert_text "Template code was successfully created"
    click_on "Back"
  end

  test "should update Template code" do
    visit template_code_url(@template_code)
    click_on "Edit this template code", match: :first

    fill_in "Code", with: @template_code.code
    fill_in "Description", with: @template_code.description
    fill_in "Example", with: @template_code.example_id
    fill_in "Lang", with: @template_code.lang_id
    fill_in "Overview", with: @template_code.overview
    fill_in "Path", with: @template_code.path
    fill_in "Title", with: @template_code.title
    click_on "Update Template code"

    assert_text "Template code was successfully updated"
    click_on "Back"
  end

  test "should destroy Template code" do
    visit template_code_url(@template_code)
    click_on "Destroy this template code", match: :first

    assert_text "Template code was successfully destroyed"
  end
end
