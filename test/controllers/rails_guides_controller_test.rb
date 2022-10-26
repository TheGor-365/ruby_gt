require "test_helper"

class RailsGuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rails_guide = rails_guides(:one)
  end

  test "should get index" do
    get rails_guides_url
    assert_response :success
  end

  test "should get new" do
    get new_rails_guide_url
    assert_response :success
  end

  test "should create rails_guide" do
    assert_difference("RailsGuide.count") do
      post rails_guides_url, params: { rails_guide: { author: @rails_guide.author, description: @rails_guide.description, title: @rails_guide.title } }
    end

    assert_redirected_to rails_guide_url(RailsGuide.last)
  end

  test "should show rails_guide" do
    get rails_guide_url(@rails_guide)
    assert_response :success
  end

  test "should get edit" do
    get edit_rails_guide_url(@rails_guide)
    assert_response :success
  end

  test "should update rails_guide" do
    patch rails_guide_url(@rails_guide), params: { rails_guide: { author: @rails_guide.author, description: @rails_guide.description, title: @rails_guide.title } }
    assert_redirected_to rails_guide_url(@rails_guide)
  end

  test "should destroy rails_guide" do
    assert_difference("RailsGuide.count", -1) do
      delete rails_guide_url(@rails_guide)
    end

    assert_redirected_to rails_guides_url
  end
end
