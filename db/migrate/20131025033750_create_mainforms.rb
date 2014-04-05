class CreateMainforms < ActiveRecord::Migration
  def change
    create_table :mainforms do |t|

      t.timestamps
    end
  end
end
