require "test_helper"

class CommandCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command_code = command_codes(:one)
  end

  test "should get index" do
    get command_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_command_code_url
    assert_response :success
  end

  test "should create command_code" do
    assert_difference("CommandCode.count") do
      post command_codes_url, params: { command_code: { body: @command_code.body, description: @command_code.description, lang_id: @command_code.lang_id, overview: @command_code.overview, path: @command_code.path, title: @command_code.title } }
    end

    assert_redirected_to command_code_url(CommandCode.last)
  end

  test "should show command_code" do
    get command_code_url(@command_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_command_code_url(@command_code)
    assert_response :success
  end

  test "should update command_code" do
    patch command_code_url(@command_code), params: { command_code: { body: @command_code.body, description: @command_code.description, lang_id: @command_code.lang_id, overview: @command_code.overview, path: @command_code.path, title: @command_code.title } }
    assert_redirected_to command_code_url(@command_code)
  end

  test "should destroy command_code" do
    assert_difference("CommandCode.count", -1) do
      delete command_code_url(@command_code)
    end

    assert_redirected_to command_codes_url
  end
end
