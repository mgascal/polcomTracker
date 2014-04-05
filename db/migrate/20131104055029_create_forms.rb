class CreateForms < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING, {:primary_key => 'KSQ_SEQ_NO'} do |t|
      t.integer :FORM_ID
      t.string :REVISED_ITEM_NO
      t.integer :STATUS
      t.string :POLICY_NAME
      t.string :FORM_LABEL
      t.string :FORM_NO
      t.date :EDITION_DATE
      t.integer :TYPE_OF_POLICY
      t.string :LOB
      t.integer :TYPE_OF_DOCUMENT
      t.string :SUBMITTER_COMPANY
      t.string :SUBMITTER_NAME
      t.string :SUBMITTERS_EMAIL
      t.string :CLIENT_REFERENCE_FILE
      t.date :DATE_RECEIVED
      t.date :DUE_DATE
      t.date :MAPPING_COMPLETED
      t.string :MAPPED_BY
      t.date :PARSING_COMPLETED
      t.date :LOADED
      t.string :NEW_FORM_ID
      t.string :TEXT_FILE_NAME
      t.string :NEW_TEXT_FILE_NAME
      t.string :NEW_POLICY_NAME
      t.string :COMMENTS
      t.date :CREATE_DATE
      t.string :CREATE_BY
      t.date :UPDATED_DATE
      t.string :UPDATED_BY
      t.string :RELATED_POLICY
      t.integer :TYPE_OF_SUBMISSION
      t.date  :CLIENT_NOTIFIED

    end
  end
end
