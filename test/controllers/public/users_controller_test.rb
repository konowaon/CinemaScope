require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get create" do
    get public_users_create_url
    assert_response :success
  end

  test "should get update" do
    get public_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_users_destroy_url
    assert_response :success
  end

  test "should get login" do
    get public_users_login_url
    assert_response :success
  end

  test "should get logout" do
    get public_users_logout_url
    assert_response :success
  end
end
