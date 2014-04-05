class CreateDocumentTypes < ActiveRecord::Migration
  def change
    create_table :FORM_TRACKING_TYPE_OF_DOCUMENT, {:primary_key => 'DOCUMENT_TYPE_ID'} do |t|
      t.string :DOCUMENT_TYPE
      t.date :CREATE_DATE
      t.string :CREATE_BY
      t.date :UPDATED_DATE
      t.string :UPDATED_BY

    end
  end
end
