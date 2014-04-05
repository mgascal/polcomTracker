class CreateUsers < ActiveRecord::Migration
  def change
    create_table :ADV_PO_USERS do |t|
      t.string :lastname
      t.string :firstname
      t.string :middlename
      t.string :department
      t.string :email
      t.string :usertype
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :status
      t.date   :create_date
      t.string :create_by
      t.date   :updated_date
      t.string :updated_by
      t.string :isActive
      
      t.timestamps
    end
  end
end
