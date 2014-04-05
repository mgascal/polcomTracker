class CreateSessions < ActiveRecord::Migration
  def change
    create_table :ADV_PO_ACTIVE_SESSIONS do |t|
      t.integer :user_id
      t.string :session_id
      t.date :time_started
      t.string :status

      t.timestamps
    end
  end
end
