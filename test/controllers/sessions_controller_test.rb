require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "shold login" do
    dave = users(:one)
    post :create , name: dave.name, password: "secret"
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]  
  end

  test "should fail login" do
    dave = user(:one)
    post :create, name: dave.name, password: "wrong"
    assert_redirected_to lo_url
    end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
    end
end