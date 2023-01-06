require "test_helper"

class ExampleCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @example_code = example_codes(:one)
  end

  test "should get index" do
    get example_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_example_code_url
    assert_response :success
  end

  test "should create example_code" do
    assert_difference("ExampleCode.count") do
      post example_codes_url, params: { example_code: { code: @example_code.code, description: @example_code.description, example_id: @example_code.example_id, lang_id: @example_code.lang_id, overview: @example_code.overview, path: @example_code.path, title: @example_code.title } }
    end

    assert_redirected_to example_code_url(ExampleCode.last)
  end

  test "should show example_code" do
    get example_code_url(@example_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_example_code_url(@example_code)
    assert_response :success
  end

  test "should update example_code" do
    patch example_code_url(@example_code), params: { example_code: { code: @example_code.code, description: @example_code.description, example_id: @example_code.example_id, lang_id: @example_code.lang_id, overview: @example_code.overview, path: @example_code.path, title: @example_code.title } }
    assert_redirected_to example_code_url(@example_code)
  end

  test "should destroy example_code" do
    assert_difference("ExampleCode.count", -1) do
      delete example_code_url(@example_code)
    end

    assert_redirected_to example_codes_url
  end
end
