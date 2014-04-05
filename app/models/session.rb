class Session < ActiveRecord::Base
  self.table_name = "ADV_PO_ACTIVE_SESSIONS"
  attr_accessible :session_id, :status, :time_started, :user_id
end
