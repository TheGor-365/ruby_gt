require "test_helper"

class GuideCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guide_code = guide_codes(:one)
  end

  test "should get index" do
    get guide_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_guide_code_url
    assert_response :success
  end

  test "should create guide_code" do
    assert_difference("GuideCode.count") do
      post guide_codes_url, params: { guide_code: {  } }
    end

    assert_redirected_to guide_code_url(GuideCode.last)
  end

  test "should show guide_code" do
    get guide_code_url(@guide_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_guide_code_url(@guide_code)
    assert_response :success
  end

  test "should update guide_code" do
    patch guide_code_url(@guide_code), params: { guide_code: {  } }
    assert_redirected_to guide_code_url(@guide_code)
  end

  test "should destroy guide_code" do
    assert_difference("GuideCode.count", -1) do
      delete guide_code_url(@guide_code)
    end

    assert_redirected_to guide_codes_url
  end
end
