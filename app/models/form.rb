class Form < ActiveRecord::Base
  self.table_name = "FORM_TRACKING"
  attr_accessible :client_reference_file, :comments, :create_by, :create_date, :date_received, :due_date, :edition_date, :form_id, :form_label, :form_no, :loaded, :lob, :mapped_by, :mapping_completed, :new_form_id, :new_policy_name, :new_text_file_name, :parsing_completed, :policy_name, :revised_item_no, :seq_no, :status, :submitters_email, :submitter_company, :submitter_name, :text_file_name, :type_of_document, :type_of_policy, :updated_by, :updated_date, :related_policy, :type_of_submission, :client_notified
end
