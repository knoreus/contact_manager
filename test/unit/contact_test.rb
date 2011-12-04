require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Required Fields are Included" do
    contact = contacts(:three)
    assert !contact.valid?
  end

  test "Assert valid record" do
    contact = contacts(:one)
    assert contact.valid?
  end

  test "All fields are valid" do
    contact = contacts(:one)
    assert contact.valid?
  end

end
