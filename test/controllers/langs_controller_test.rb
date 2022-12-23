require "test_helper"

class LangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lang = langs(:one)
  end

  test "should get index" do
    get langs_url
    assert_response :success
  end

  test "should get new" do
    get new_lang_url
    assert_response :success
  end

  test "should create lang" do
    assert_difference("Lang.count") do
      post langs_url, params: { lang: { name: @lang.name } }
    end

    assert_redirected_to lang_url(Lang.last)
  end

  test "should show lang" do
    get lang_url(@lang)
    assert_response :success
  end

  test "should get edit" do
    get edit_lang_url(@lang)
    assert_response :success
  end

  test "should update lang" do
    patch lang_url(@lang), params: { lang: { name: @lang.name } }
    assert_redirected_to lang_url(@lang)
  end

  test "should destroy lang" do
    assert_difference("Lang.count", -1) do
      delete lang_url(@lang)
    end

    assert_redirected_to langs_url
  end
end
