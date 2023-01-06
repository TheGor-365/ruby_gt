require "test_helper"

class TemplateCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @template_code = template_codes(:one)
  end

  test "should get index" do
    get template_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_template_code_url
    assert_response :success
  end

  test "should create template_code" do
    assert_difference("TemplateCode.count") do
      post template_codes_url, params: { template_code: { code: @template_code.code, description: @template_code.description, example_id: @template_code.example_id, lang_id: @template_code.lang_id, overview: @template_code.overview, path: @template_code.path, title: @template_code.title } }
    end

    assert_redirected_to template_code_url(TemplateCode.last)
  end

  test "should show template_code" do
    get template_code_url(@template_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_template_code_url(@template_code)
    assert_response :success
  end

  test "should update template_code" do
    patch template_code_url(@template_code), params: { template_code: { code: @template_code.code, description: @template_code.description, example_id: @template_code.example_id, lang_id: @template_code.lang_id, overview: @template_code.overview, path: @template_code.path, title: @template_code.title } }
    assert_redirected_to template_code_url(@template_code)
  end

  test "should destroy template_code" do
    assert_difference("TemplateCode.count", -1) do
      delete template_code_url(@template_code)
    end

    assert_redirected_to template_codes_url
  end
end
