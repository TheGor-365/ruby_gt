require "test_helper"

class TutorialCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tutorial_code = tutorial_codes(:one)
  end

  test "should get index" do
    get tutorial_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_tutorial_code_url
    assert_response :success
  end

  test "should create tutorial_code" do
    assert_difference("TutorialCode.count") do
      post tutorial_codes_url, params: { tutorial_code: { code: @tutorial_code.code, description: @tutorial_code.description, lang_id: @tutorial_code.lang_id, overview: @tutorial_code.overview, path: @tutorial_code.path, title: @tutorial_code.title, tutorial_id: @tutorial_code.tutorial_id } }
    end

    assert_redirected_to tutorial_code_url(TutorialCode.last)
  end

  test "should show tutorial_code" do
    get tutorial_code_url(@tutorial_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_tutorial_code_url(@tutorial_code)
    assert_response :success
  end

  test "should update tutorial_code" do
    patch tutorial_code_url(@tutorial_code), params: { tutorial_code: { code: @tutorial_code.code, description: @tutorial_code.description, lang_id: @tutorial_code.lang_id, overview: @tutorial_code.overview, path: @tutorial_code.path, title: @tutorial_code.title, tutorial_id: @tutorial_code.tutorial_id } }
    assert_redirected_to tutorial_code_url(@tutorial_code)
  end

  test "should destroy tutorial_code" do
    assert_difference("TutorialCode.count", -1) do
      delete tutorial_code_url(@tutorial_code)
    end

    assert_redirected_to tutorial_codes_url
  end
end
