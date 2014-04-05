class CreateProprietaries < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING_MEMBERSHIP, {:id => false} do |t|
      t.integer :KSQ_SEQ_NO
      t.string :MEMBERSHIP

      t.timestamps
    end
  end
end
