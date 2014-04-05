class PolicyType < ActiveRecord::Base
  self.table_name = "FORM_TRACKING_TYPE_OF_POLICY"
  attr_accessible :create_by, :create_date, :policy_type, :updated_by, :updated_date
  validates_presence_of :policy_type
  validates_uniqueness_of :policy_type
end
