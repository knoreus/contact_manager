require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
   include SessionsHelper

  setup do
    @user = users(:one)
    login_user @user
    @contact = contacts(:one)
  end

  teardown do
    logout_user
    @user = nil
    @contact = nil

  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should destroy contact" do

    assert_difference('current_user.contacts.count', -1) do
      delete :destroy, id: @contact.to_param
    end

    assert_redirected_to user_path(@user)
  end

  test "should get edit" do
    get :edit, id: @contact.to_param
    assert_response :success
  end

  test "should create contact" do
    assert_difference('current_user.contacts.count') do
      post :create, :contact => { :first_name => 'Kevin', :last_name => 'Noreus' }
    end

     assert_redirected_to user_path(@user)
  end

  test "should copy contact" do
    get :copy, id: @contact.to_param
    assert_redirected_to new_contact_path
  end



  test "should get index" do
    get :index
    assert_response :success
  end

end
