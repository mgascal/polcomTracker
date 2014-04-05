class DocumentType < ActiveRecord::Base
  self.table_name = "FORM_TRACKING_TYPE_OF_DOCUMENT"
  attr_accessible :create_by, :create_date, :document_type, :updated_by, :updated_date
  validates_presence_of :document_type
  validates_uniqueness_of :document_type
end
