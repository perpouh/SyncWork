require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get show" do
    get user_path(users(:one))
    assert_response :success
  end

  test "should get delete" do
    delete user_path(users(:one))
    assert_response :success
  end
end
