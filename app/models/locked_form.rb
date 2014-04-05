class LockedForm < ActiveRecord::Base
  self.table_name = "ADV_PO_LOCKED_FORMS"
  attr_accessible :FORM_ID, :SESSION_ID, :USER_ID
end
