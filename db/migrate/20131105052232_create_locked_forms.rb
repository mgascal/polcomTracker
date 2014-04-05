class CreateLockedForms < ActiveRecord::Migration
  def change
    create_table :ADV_PO_LOCKED_FORMS do |t|
      t.integer :KSQ_SEQ_NO
      t.integer :USER_ID
      t.string :SESSION_ID

      t.timestamps
    end
  end
end
