require "test_helper"

class SnippetCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snippet_code = snippet_codes(:one)
  end

  test "should get index" do
    get snippet_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_snippet_code_url
    assert_response :success
  end

  test "should create snippet_code" do
    assert_difference("SnippetCode.count") do
      post snippet_codes_url, params: { snippet_code: { code: @snippet_code.code, description: @snippet_code.description, lang_id: @snippet_code.lang_id, overview: @snippet_code.overview, path: @snippet_code.path, snippet_id: @snippet_code.snippet_id } }
    end

    assert_redirected_to snippet_code_url(SnippetCode.last)
  end

  test "should show snippet_code" do
    get snippet_code_url(@snippet_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_snippet_code_url(@snippet_code)
    assert_response :success
  end

  test "should update snippet_code" do
    patch snippet_code_url(@snippet_code), params: { snippet_code: { code: @snippet_code.code, description: @snippet_code.description, lang_id: @snippet_code.lang_id, overview: @snippet_code.overview, path: @snippet_code.path, snippet_id: @snippet_code.snippet_id } }
    assert_redirected_to snippet_code_url(@snippet_code)
  end

  test "should destroy snippet_code" do
    assert_difference("SnippetCode.count", -1) do
      delete snippet_code_url(@snippet_code)
    end

    assert_redirected_to snippet_codes_url
  end
end
