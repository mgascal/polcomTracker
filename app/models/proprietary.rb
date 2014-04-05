class Proprietary < ActiveRecord::Base
  self.table_name = "FORM_TRACKING_MEMBERSHIP"
  attr_accessible :KSQ_SEQ_NO, :MEMBERSHIP
end
