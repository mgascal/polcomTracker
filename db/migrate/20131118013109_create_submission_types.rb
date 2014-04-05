class CreateSubmissionTypes < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING_TYPE_SUBMISSION, {:primary_key => 'SUBMISSION_TYPE_ID'} do |t|
      t.string :SUBMISSION_TYPE
      t.date :CREATE_DATE
      t.string :CREATE_BY
      t.date :UPDATED_DATE
      t.string :UPDATED_BY

    end
  end
end
