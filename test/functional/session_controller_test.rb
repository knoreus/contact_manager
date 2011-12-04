require 'test_helper'

class SessionControllerTest < ActionController::TestCase

  setup do
    #@current_user = users(:one)
  end

  test "should get create" do
    post :create, :session => { [:email] => "knoreus@gmail.com"}

    assert_redirected_to users_path
  end



end
