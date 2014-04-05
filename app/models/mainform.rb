class Mainform < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :session_id, :status, :time_started, :user_id
end
