require 'test_helper'

class ConferenceRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conference_rooms_index_url
    assert_response :success
  end

  test "should get new" do
    get conference_rooms_new_url
    assert_response :success
  end

  test "should get edit" do
    get conference_rooms_edit_url
    assert_response :success
  end

  test "should get show" do
    get conference_rooms_show_url
    assert_response :success
  end

end
