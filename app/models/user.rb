class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name, :presence => true
  validates :email, :format =>  { :with => /^.+@.+$/, :message => "Invalid Email Address" },
                    :uniqueness => true

  has_many :contacts
end
