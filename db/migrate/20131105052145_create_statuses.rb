class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING_STATUS, {:primary_key => 'STATUS_ID'} do |t|
      t.string :STATUS
      t.date :CREATE_DATE
      t.string :CREATE_BY
      t.date :UPDATED_DATE
      t.string :UPDATED_BY

    end
  end
end
