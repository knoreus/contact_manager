require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_1
    puts "test_1"
    assert_equal(1, 1)
  end

  test "User Count" do
    assert_equal 4, User.count
  end

  test "User Names" do
    assert_equal "Kevin Noreus", users(:one).name
    assert_equal "John Doe", users(:two).name
    assert_equal nil, users(:noname).name
    assert_equal "bad email", users(:bademail).name
  end

  test "User emails" do
    assert_equal "knoreus@gmail.com", users(:one).email
  end

  test "User should not save without name or email" do
    user =  User.new
    assert !user.save
  end

  test "User should not save with invalid email format" do
    user = users(:bademail)
    assert !user.save

    #fix the email
    user.email = "test@aaa.com"
    assert user.save

  end

  test "User should be unique by email" do
    user = users(:one)
    new_user = User.create :name => user.name, :email => user.email
    assert !user.save
  end

  test "User should respond to password attr" do
    #user = users(:one)
    #assert user.respond_to? :password

    #assert
  end
end
