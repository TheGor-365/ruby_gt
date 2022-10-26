require "application_system_test_case"

class RailsGuidesTest < ApplicationSystemTestCase
  setup do
    @rails_guide = rails_guides(:one)
  end

  test "visiting the index" do
    visit rails_guides_url
    assert_selector "h1", text: "Rails guides"
  end

  test "should create rails guide" do
    visit rails_guides_url
    click_on "New rails guide"

    fill_in "Author", with: @rails_guide.author
    fill_in "Description", with: @rails_guide.description
    fill_in "Title", with: @rails_guide.title
    click_on "Create Rails guide"

    assert_text "Rails guide was successfully created"
    click_on "Back"
  end

  test "should update Rails guide" do
    visit rails_guide_url(@rails_guide)
    click_on "Edit this rails guide", match: :first

    fill_in "Author", with: @rails_guide.author
    fill_in "Description", with: @rails_guide.description
    fill_in "Title", with: @rails_guide.title
    click_on "Update Rails guide"

    assert_text "Rails guide was successfully updated"
    click_on "Back"
  end

  test "should destroy Rails guide" do
    visit rails_guide_url(@rails_guide)
    click_on "Destroy this rails guide", match: :first

    assert_text "Rails guide was successfully destroyed"
  end
end
