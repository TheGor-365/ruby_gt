require "application_system_test_case"

class LangsTest < ApplicationSystemTestCase
  setup do
    @lang = langs(:one)
  end

  test "visiting the index" do
    visit langs_url
    assert_selector "h1", text: "Langs"
  end

  test "should create lang" do
    visit langs_url
    click_on "New lang"

    fill_in "Name", with: @lang.name
    click_on "Create Lang"

    assert_text "Lang was successfully created"
    click_on "Back"
  end

  test "should update Lang" do
    visit lang_url(@lang)
    click_on "Edit this lang", match: :first

    fill_in "Name", with: @lang.name
    click_on "Update Lang"

    assert_text "Lang was successfully updated"
    click_on "Back"
  end

  test "should destroy Lang" do
    visit lang_url(@lang)
    click_on "Destroy this lang", match: :first

    assert_text "Lang was successfully destroyed"
  end
end
