require "test_helper"

class Public::MovieControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_movie_index_url
    assert_response :success
  end

  test "should get show" do
    get public_movie_show_url
    assert_response :success
  end
end
