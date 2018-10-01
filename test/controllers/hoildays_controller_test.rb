require 'test_helper'

class HoildaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hoildays_index_url
    assert_response :success
  end

  test "should get new" do
    get hoildays_new_url
    assert_response :success
  end

  test "should get edit" do
    get hoildays_edit_url
    assert_response :success
  end

  test "should get show" do
    get hoildays_show_url
    assert_response :success
  end

end
