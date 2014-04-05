class SubmissionType < ActiveRecord::Base
  self.table_name = "FORM_TRACKING_TYPE_SUBMISSION"
  attr_accessible :create_by, :create_date, :submission_type, :updated_by, :updated_date
  validates_presence_of :submission_type
  validates_uniqueness_of :submission_type
end
