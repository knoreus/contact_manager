class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :home_phone
      t.string :mobile_phone

      t.timestamps
    end
  end
end
