class Status < ActiveRecord::Base
  self.table_name = "FORM_TRACKING_STATUS"
  attr_accessible :create_by, :create_date, :status, :updated_by, :updated_date
  validates_presence_of :status
  validates_uniqueness_of :status
end
