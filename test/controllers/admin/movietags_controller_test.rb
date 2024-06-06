require "test_helper"

class Admin::MovietagsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_movietags_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_movietags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_movietags_destroy_url
    assert_response :success
  end
end
