class Contact < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true,
                    :format =>  { :with => /^.+@.+$/, :message => "Invalid Email Address" }

  belongs_to :user

  def full_name
    "#{last_name}, #{first_name}"
  end
end
