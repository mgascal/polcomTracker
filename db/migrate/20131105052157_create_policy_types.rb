class CreatePolicyTypes < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING_TYPE_OF_POLICY, {:primary_key => 'POLICY_TYPE_ID'} do |t|
      t.string :POLICY_TYPE
      t.date :CREATE_DATE
      t.string :CREATE_BY
      t.date :UPDATED_DATE
      t.string :UPDATED_BY

    end
  end
end
