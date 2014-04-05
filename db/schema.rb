# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140120031014) do

  create_table "ad_policy_47_tmp", :id => false, :force => true do |t|
    t.integer "program_id",                 :precision => 38, :scale => 0, :null => false
    t.integer "policy_id",                  :precision => 38, :scale => 0, :null => false
    t.integer "rate",                       :precision => 38, :scale => 0
    t.string  "primary_indic", :limit => 1
  end

  add_index "ad_policy_47_tmp", ["program_id"], :name => "idx_tmp_pol"

  create_table "ad_policy_47_tmp2", :id => false, :force => true do |t|
    t.integer "program_id",                 :precision => 38, :scale => 0, :null => false
    t.integer "policy_id",                  :precision => 38, :scale => 0, :null => false
    t.integer "rate",                       :precision => 38, :scale => 0
    t.string  "primary_indic", :limit => 1
  end

  create_table "adv_lu_sic_2", :id => false, :force => true do |t|
    t.string "sic_2",      :limit => 2
    t.string "sic_2_desc", :limit => 200
  end

  create_table "adv_lu_sic_3", :id => false, :force => true do |t|
    t.string "sic_3",      :limit => 3
    t.string "sic_3_desc", :limit => 200
  end

  create_table "adv_po_active_sessions", :force => true do |t|
    t.integer  "user_id",      :precision => 38, :scale => 0
    t.string   "session_id"
    t.datetime "time_started"
    t.string   "status"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "adv_po_locked_forms", :force => true do |t|
    t.integer  "ksq_seq_no", :precision => 38, :scale => 0
    t.integer  "user_id",    :precision => 38, :scale => 0
    t.string   "session_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "adv_po_users", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "department"
    t.string   "email"
    t.string   "usertype"
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "status"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
    t.string   "isActive"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "comics", :id => false, :force => true do |t|
    t.string  "title",     :limit => 200
    t.integer "issue",                    :precision => 38, :scale => 0
    t.string  "publisher", :limit => 200
  end

  create_table "company", :id => false, :force => true do |t|
    t.decimal "company_id",                       :null => false
    t.string  "company_name",      :limit => 500
    t.string  "ticker",            :limit => 10
    t.string  "exchange",          :limit => 20
    t.string  "primary_source",    :limit => 10
    t.string  "f4293_status",      :limit => 1
    t.string  "short_name",        :limit => 8
    t.string  "status",            :limit => 5
    t.string  "status_reason_cd",  :limit => 25
    t.string  "status_date",       :limit => 8
    t.string  "organization_type", :limit => 50
    t.string  "relationship_type", :limit => 50
  end

  create_table "company_hierarchies", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "exhibit", :id => false, :force => true do |t|
    t.decimal  "company_id"
    t.string   "country",              :limit => 3
    t.decimal  "mascad_id",                            :null => false
    t.decimal  "gics2"
    t.string   "gics2_desc",           :limit => 500
    t.string   "category_description", :limit => 100,  :null => false
    t.string   "type_description",     :limit => 100,  :null => false
    t.datetime "filing_date"
    t.decimal  "year"
    t.string   "quarter",              :limit => 2
    t.string   "juris_trigger",        :limit => 100,  :null => false
    t.string   "court_name",           :limit => 1000, :null => false
  end

  create_table "form_tracking", :primary_key => "ksq_seq_no", :force => true do |t|
    t.integer  "form_id",               :precision => 38, :scale => 0
    t.string   "revised_item_no"
    t.integer  "status",                :precision => 38, :scale => 0
    t.string   "policy_name"
    t.string   "form_label"
    t.string   "form_no"
    t.datetime "edition_date"
    t.integer  "type_of_policy",        :precision => 38, :scale => 0
    t.string   "lob"
    t.integer  "type_of_document",      :precision => 38, :scale => 0
    t.string   "submitter_company"
    t.string   "submitter_name"
    t.string   "submitters_email"
    t.string   "client_reference_file"
    t.datetime "date_received"
    t.datetime "due_date"
    t.datetime "mapping_completed"
    t.string   "mapped_by"
    t.datetime "parsing_completed"
    t.datetime "loaded"
    t.string   "new_form_id"
    t.string   "text_file_name"
    t.string   "new_text_file_name"
    t.string   "new_policy_name"
    t.string   "comments"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
    t.string   "related_policy"
    t.integer  "type_of_submission",    :precision => 38, :scale => 0
    t.datetime "client_notified"
  end

  create_table "form_tracking_membership", :id => false, :force => true do |t|
    t.integer  "ksq_seq_no", :precision => 38, :scale => 0
    t.string   "membership"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "form_tracking_status", :primary_key => "status_id", :force => true do |t|
    t.string   "status"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
  end

  create_table "form_tracking_type_of_document", :primary_key => "document_type_id", :force => true do |t|
    t.string   "document_type"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
  end

  create_table "form_tracking_type_of_policy", :primary_key => "policy_type_id", :force => true do |t|
    t.string   "policy_type"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
  end

  create_table "form_tracking_type_submission", :primary_key => "submission_type_id", :force => true do |t|
    t.string   "submission_type"
    t.datetime "create_date"
    t.string   "create_by"
    t.datetime "updated_date"
    t.string   "updated_by"
  end

  create_table "heatmap_case_finance_sub", :id => false, :force => true do |t|
    t.string   "case_id"
    t.string   "plaintiff",          :limit => 1
    t.string   "defendant",          :limit => 1
    t.string   "other",              :limit => 1
    t.integer  "ult_parent_id",                      :precision => 38, :scale => 0
    t.integer  "courtnum",           :limit => 20,   :precision => 20, :scale => 0, :null => false
    t.string   "docketnumber",       :limit => 50,                                  :null => false
    t.datetime "file_date",                                                         :null => false
    t.boolean  "closed",                             :precision => 1,  :scale => 0, :null => false
    t.string   "typename_uc",        :limit => 50
    t.integer  "typecode",           :limit => 20,   :precision => 20, :scale => 0, :null => false
    t.string   "state_via_courtnum", :limit => 2
    t.string   "category",           :limit => 1000
    t.integer  "rownumber",                          :precision => 38, :scale => 0
    t.string   "caption",            :limit => 1000
    t.string   "ult_parent_name",    :limit => 500
    t.string   "full_court_name",    :limit => 1000
  end

  create_table "heatmap_company_cons_tmp1", :id => false, :force => true do |t|
    t.integer "company_id",                         :precision => 38, :scale => 0
    t.integer "ult_parent_id",                      :precision => 38, :scale => 0
    t.string  "ult_parent_name",    :limit => 1000
    t.integer "gvkey",                              :precision => 38, :scale => 0
    t.string  "sic",                :limit => 4
    t.string  "sicdesc",            :limit => 1000
    t.string  "pub_prv_oth",        :limit => 3
    t.string  "ticker",             :limit => 10
    t.string  "exchange",           :limit => 20
    t.string  "active_or_inactive", :limit => 5
    t.string  "country_code",       :limit => 3
    t.string  "street_addr_1",      :limit => 1000
    t.string  "street_addr_2",      :limit => 1000
    t.string  "state",              :limit => 1000
    t.string  "zip",                :limit => 1000
    t.string  "country",            :limit => 1000
    t.string  "phone",              :limit => 1000
    t.integer "revenues",                           :precision => 38, :scale => 0
    t.integer "employees",                          :precision => 38, :scale => 0
    t.integer "market_cap",                         :precision => 38, :scale => 0
    t.integer "hierarchy_depth",                    :precision => 38, :scale => 0
  end

  create_table "heatmap_company_cons_tmp2", :id => false, :force => true do |t|
    t.string  "case_id"
    t.string  "plaintiff",     :limit => 1
    t.string  "defendant",     :limit => 1
    t.string  "other",         :limit => 1
    t.integer "ult_parent_id",              :precision => 38, :scale => 0
  end

  create_table "heatmap_company_cons_tmp5", :id => false, :force => true do |t|
    t.string  "case_id"
    t.string  "plaintiff",     :limit => 1
    t.string  "defendant",     :limit => 1
    t.string  "other",         :limit => 1
    t.integer "ult_parent_id",              :precision => 38, :scale => 0
  end

  create_table "heatmap_company_construction", :id => false, :force => true do |t|
    t.integer "ult_parent_id",                      :precision => 38, :scale => 0
    t.string  "ult_parent_name",    :limit => 1000
    t.integer "gvkey",                              :precision => 38, :scale => 0
    t.string  "sic",                :limit => 4
    t.string  "sicdesc",            :limit => 1000
    t.string  "pub_prv_oth",        :limit => 3
    t.string  "ticker",             :limit => 10
    t.string  "exchange",           :limit => 20
    t.string  "active_or_inactive", :limit => 5
    t.string  "country_code",       :limit => 3
    t.string  "street_addr_1",      :limit => 1000
    t.string  "street_addr_2",      :limit => 1000
    t.string  "state",              :limit => 1000
    t.string  "zip",                :limit => 1000
    t.string  "country",            :limit => 1000
    t.string  "phone",              :limit => 1000
    t.integer "revenues",                           :precision => 38, :scale => 0
    t.integer "employees",                          :precision => 38, :scale => 0
    t.integer "market_cap",                         :precision => 38, :scale => 0
    t.integer "hierarchy_depth",                    :precision => 38, :scale => 0
  end

  create_table "lob_47", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "duns",                               :precision => 38, :scale => 0
    t.integer  "limit",                              :precision => 38, :scale => 0
  end

  create_table "lob_47_limit", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "duns",                               :precision => 38, :scale => 0
    t.integer  "limit",                              :precision => 38, :scale => 0
    t.integer  "sum_limit",                          :precision => 38, :scale => 0
  end

  create_table "lob_47_sec2", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.integer  "policy_id",                          :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "lob",                                :precision => 38, :scale => 0, :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "program_premium",                    :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "duns_number",                        :precision => 38, :scale => 0
  end

  create_table "lob_47_sec3", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "duns_number",                        :precision => 38, :scale => 0
  end

  create_table "lob_47_sec4", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "duns_number",                        :precision => 38, :scale => 0
  end

  create_table "lob_47_sec5", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.integer  "policy_id",                          :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "lob",                                :precision => 38, :scale => 0, :null => false
    t.integer  "peroccurence_limit",                 :precision => 38, :scale => 0
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "program_premium",                    :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "duns_number",                        :precision => 38, :scale => 0
  end

  create_table "lob_47_sec6", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "duns_number",                        :precision => 38, :scale => 0
    t.integer  "peroccurence_limit",                 :precision => 38, :scale => 0
  end

  create_table "lob_47_stag", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.integer  "policy_id",                          :precision => 38, :scale => 0, :null => false
    t.datetime "effective_date",                                                    :null => false
    t.integer  "lob",                                :precision => 38, :scale => 0, :null => false
    t.integer  "data_owner_id",                      :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",     :limit => 256,                                :null => false
    t.integer  "insured_id",                         :precision => 38, :scale => 0
    t.string   "company_name",        :limit => 500
    t.string   "organization_type",   :limit => 50
    t.string   "street_addr_1",       :limit => 150
    t.string   "city",                :limit => 500
    t.string   "state",               :limit => 20
    t.string   "zip",                 :limit => 15
    t.string   "country_code",        :limit => 3
    t.integer  "program_premium",                    :precision => 38, :scale => 0
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "limit",                              :precision => 38, :scale => 0
    t.integer  "sales",                              :precision => 38, :scale => 0
    t.integer  "number_of_employees",                :precision => 38, :scale => 0
  end

  create_table "lob_universe", :id => false, :force => true do |t|
    t.integer  "data_owner_id",                             :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",            :limit => 256,                                :null => false
    t.string   "data_owner_type",            :limit => 20,                                 :null => false
    t.string   "inclusion_indic",            :limit => 1
    t.string   "recent_program_indic",       :limit => 1
    t.integer  "primary_policy_id",                         :precision => 38, :scale => 0
    t.integer  "company_id",                                :precision => 38, :scale => 0, :null => false
    t.integer  "gvkey",                                     :precision => 38, :scale => 0
    t.integer  "program_id",                                :precision => 38, :scale => 0, :null => false
    t.datetime "prog_effective_date",                                                      :null => false
    t.integer  "prog_effective_year",                       :precision => 38, :scale => 0
    t.datetime "prog_expiration_date",                                                     :null => false
    t.integer  "prog_expiration_year",                      :precision => 38, :scale => 0
    t.datetime "pol_effective_date"
    t.datetime "pol_expiration_date"
    t.string   "company_name",               :limit => 500
    t.string   "address_1",                  :limit => 150
    t.string   "city",                       :limit => 500
    t.string   "state",                      :limit => 20
    t.string   "zip",                        :limit => 15
    t.string   "country",                    :limit => 50
    t.string   "company_type",               :limit => 50
    t.integer  "ult_id",                                    :precision => 38, :scale => 0
    t.integer  "ult_gvkey",                                 :precision => 38, :scale => 0
    t.string   "ult_name",                   :limit => 200
    t.string   "ult_type",                   :limit => 3
    t.string   "sic",                        :limit => 10
    t.string   "sic_desc",                   :limit => 100
    t.string   "ult_sic",                    :limit => 4
    t.string   "ult_sic_desc",               :limit => 100
    t.string   "sic_division_desc",          :limit => 200
    t.string   "sic2",                       :limit => 2
    t.string   "sic2_desc",                  :limit => 200
    t.string   "sic3",                       :limit => 3
    t.string   "sic3_desc",                  :limit => 200
    t.integer  "gics8",                                     :precision => 38, :scale => 0
    t.string   "gics8_desc",                 :limit => 100
    t.integer  "gics6",                                     :precision => 38, :scale => 0
    t.string   "gics6_desc",                 :limit => 100
    t.integer  "gics4",                                     :precision => 38, :scale => 0
    t.string   "gics4_desc",                 :limit => 100
    t.integer  "gics2",                                     :precision => 38, :scale => 0
    t.string   "gics2_desc",                 :limit => 100
    t.integer  "lob_id",                                    :precision => 38, :scale => 0
    t.string   "company_financials_status",  :limit => 200
    t.integer  "revenues",                                  :precision => 38, :scale => 0
    t.integer  "revenues_id",                               :precision => 38, :scale => 0
    t.string   "revenues_id_name",           :limit => 100
    t.integer  "num_employees",                             :precision => 38, :scale => 0
    t.integer  "num_employees_id",                          :precision => 38, :scale => 0
    t.string   "num_employees_id_name",      :limit => 100
    t.integer  "marketcap",                                 :precision => 38, :scale => 0
    t.integer  "marketcap_id",                              :precision => 38, :scale => 0
    t.string   "marketcap_id_name",          :limit => 100
    t.string   "rev_mc_indic",               :limit => 3
    t.string   "ult_financials_status",      :limit => 200
    t.integer  "ult_revenues",                              :precision => 38, :scale => 0
    t.integer  "ult_revenues_id",                           :precision => 38, :scale => 0
    t.string   "ult_revenues_id_name",       :limit => 100
    t.integer  "ult_num_of_employees",                      :precision => 38, :scale => 0
    t.integer  "ult_num_employees_id",                      :precision => 38, :scale => 0
    t.string   "ult_num_employees_id_name",  :limit => 100
    t.integer  "ult_marketcap",                             :precision => 38, :scale => 0
    t.integer  "ult_marketcap_id",                          :precision => 38, :scale => 0
    t.string   "ult_marketcap_id_name",      :limit => 100
    t.integer  "program_premium",                           :precision => 38, :scale => 0
    t.integer  "program_limit",                             :precision => 38, :scale => 0
    t.integer  "program_retention",                         :precision => 38, :scale => 0
    t.integer  "principal_coverage",                        :precision => 38, :scale => 0
    t.integer  "premium_lob",                               :precision => 38, :scale => 0
    t.integer  "premium_lob_id",                            :precision => 38, :scale => 0
    t.string   "premium_lob_id_name",        :limit => 100
    t.integer  "limit_lob",                                 :precision => 38, :scale => 0
    t.integer  "limit_lob_id",                              :precision => 38, :scale => 0
    t.string   "limit_lob_id_name",          :limit => 100
    t.integer  "attachment_point",                          :precision => 38, :scale => 0
    t.integer  "attachment_point_id",                       :precision => 38, :scale => 0
    t.string   "attachment_point_id_name",   :limit => 100
    t.integer  "number_of_program_policies",                :precision => 38, :scale => 0
    t.integer  "number_of_lob_policies",                    :precision => 38, :scale => 0
  end

  create_table "lob_universe_ima", :id => false, :force => true do |t|
    t.integer  "data_owner_id",                           :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",          :limit => 256,                                :null => false
    t.integer  "program_id",                              :precision => 38, :scale => 0, :null => false
    t.integer  "primary_policy_id",                       :precision => 38, :scale => 0
    t.datetime "prog_effective_date",                                                    :null => false
    t.datetime "pol_effective_date"
    t.integer  "company_id",                              :precision => 38, :scale => 0, :null => false
    t.string   "company_name",             :limit => 500
    t.string   "company_type",             :limit => 50
    t.string   "sic_division_desc",        :limit => 200
    t.string   "sic2",                     :limit => 2
    t.string   "sic2_desc",                :limit => 200
    t.string   "sic3",                     :limit => 3
    t.string   "sic3_desc",                :limit => 200
    t.string   "sic",                      :limit => 10
    t.string   "sic_desc",                 :limit => 100
    t.integer  "revenues",                                :precision => 38, :scale => 0
    t.string   "revenues_id_name",         :limit => 100
    t.integer  "premium_lob",                             :precision => 38, :scale => 0
    t.string   "premium_lob_id_name",      :limit => 100
    t.integer  "limit_lob",                               :precision => 38, :scale => 0
    t.string   "limit_lob_id_name",        :limit => 100
    t.integer  "attachment_point",                        :precision => 38, :scale => 0
    t.string   "attachment_point_id_name", :limit => 100
    t.integer  "rpm",                                     :precision => 38, :scale => 0
    t.integer  "sic1_peer",                               :precision => 38, :scale => 0
    t.integer  "sic2_peer",                               :precision => 38, :scale => 0
    t.integer  "sic3_peer",                               :precision => 38, :scale => 0
    t.integer  "sic4_peer",                               :precision => 38, :scale => 0
    t.integer  "sic_sel",                                 :precision => 38, :scale => 0
    t.integer  "peer_group",                              :precision => 38, :scale => 0
    t.integer  "limit_25",                                :precision => 38, :scale => 0
    t.integer  "limit_med",                               :precision => 38, :scale => 0
    t.integer  "limit_75",                                :precision => 38, :scale => 0
    t.integer  "premium_25",                              :precision => 38, :scale => 0
    t.integer  "premium_med",                             :precision => 38, :scale => 0
    t.integer  "premium_75",                              :precision => 38, :scale => 0
    t.integer  "rpm_25",                                  :precision => 38, :scale => 0
    t.integer  "rpm_med",                                 :precision => 38, :scale => 0
    t.integer  "rpm_75",                                  :precision => 38, :scale => 0
  end

  create_table "lob_universe_ima_final", :id => false, :force => true do |t|
    t.integer  "program_id",                         :precision => 38, :scale => 0, :null => false
    t.integer  "primary_policy_id",                  :precision => 38, :scale => 0
    t.datetime "prog_effective_date",                                               :null => false
    t.integer  "company_id",                         :precision => 38, :scale => 0, :null => false
    t.string   "company_name",        :limit => 500
    t.string   "sic",                 :limit => 10
    t.string   "sic_macro",           :limit => 200
    t.string   "sic_peer_group",      :limit => 200
    t.integer  "sic_sel",                            :precision => 38, :scale => 0
    t.integer  "revenues",                           :precision => 38, :scale => 0
    t.string   "revenues_peer_group", :limit => 100
    t.integer  "premium",                            :precision => 38, :scale => 0
    t.integer  "limit",                              :precision => 38, :scale => 0
    t.integer  "rpm",                                :precision => 38, :scale => 0
    t.integer  "peer_group",                         :precision => 38, :scale => 0
    t.integer  "limit_25",                           :precision => 38, :scale => 0
    t.integer  "limit_med",                          :precision => 38, :scale => 0
    t.integer  "limit_diff_to_med",                  :precision => 38, :scale => 0
    t.integer  "incr_prem_med",                      :precision => 38, :scale => 0
    t.integer  "new_prem_med",                       :precision => 38, :scale => 0
    t.integer  "limit_75",                           :precision => 38, :scale => 0
    t.integer  "limit_diff_to_75",                   :precision => 38, :scale => 0
    t.integer  "incr_prem_75",                       :precision => 38, :scale => 0
    t.integer  "new_prem_75",                        :precision => 38, :scale => 0
    t.integer  "premium_25",                         :precision => 38, :scale => 0
    t.integer  "premium_med",                        :precision => 38, :scale => 0
    t.integer  "premium_75",                         :precision => 38, :scale => 0
    t.integer  "calc_rpm_25",                        :precision => 38, :scale => 0
    t.integer  "calc_rpm_med",                       :precision => 38, :scale => 0
    t.integer  "med_25_rpm_pct",                     :precision => 38, :scale => 0
    t.integer  "calc_rpm_75",                        :precision => 38, :scale => 0
    t.integer  "med_75_rpm_pct",                     :precision => 38, :scale => 0
    t.integer  "rpm_25",                             :precision => 38, :scale => 0
    t.integer  "rpm_med",                            :precision => 38, :scale => 0
    t.integer  "rpm_75",                             :precision => 38, :scale => 0
    t.integer  "rpm1",                               :precision => 38, :scale => 0
    t.integer  "rpm2",                               :precision => 38, :scale => 0
    t.string   "parent_insured",      :limit => 256
    t.string   "carrier",             :limit => 300
  end

  create_table "lob_universe_peers", :id => false, :force => true do |t|
    t.integer  "data_owner_id",                           :precision => 38, :scale => 0, :null => false
    t.string   "data_owner_name",          :limit => 256,                                :null => false
    t.integer  "program_id",                              :precision => 38, :scale => 0, :null => false
    t.integer  "primary_policy_id",                       :precision => 38, :scale => 0
    t.datetime "prog_effective_date",                                                    :null => false
    t.datetime "pol_effective_date"
    t.integer  "company_id",                              :precision => 38, :scale => 0, :null => false
    t.string   "company_name",             :limit => 500
    t.string   "company_type",             :limit => 50
    t.string   "sic_division_desc",        :limit => 200
    t.string   "sic2",                     :limit => 2
    t.string   "sic2_desc",                :limit => 200
    t.string   "sic3",                     :limit => 3
    t.string   "sic3_desc",                :limit => 200
    t.string   "sic",                      :limit => 10
    t.string   "sic_desc",                 :limit => 100
    t.integer  "revenues",                                :precision => 38, :scale => 0
    t.string   "revenues_id_name",         :limit => 100
    t.integer  "premium_lob",                             :precision => 38, :scale => 0
    t.string   "premium_lob_id_name",      :limit => 100
    t.integer  "limit_lob",                               :precision => 38, :scale => 0
    t.string   "limit_lob_id_name",        :limit => 100
    t.integer  "attachment_point",                        :precision => 38, :scale => 0
    t.string   "attachment_point_id_name", :limit => 100
    t.integer  "rpm",                                     :precision => 38, :scale => 0
  end

  create_table "lob_universe_peers_stats_l", :id => false, :force => true do |t|
    t.string  "revenues_id_name", :limit => 100
    t.string  "sic",              :limit => 200
    t.integer "limit",                           :precision => 38, :scale => 0
    t.integer "sic_type",                        :precision => 38, :scale => 0
    t.string  "category",         :limit => 12
  end

  create_table "lob_universe_peers_stats_ml", :id => false, :force => true do |t|
    t.string  "marketcap_id_name", :limit => 100
    t.string  "sic",               :limit => 200
    t.integer "limit",                            :precision => 38, :scale => 0
    t.integer "sic_type",                         :precision => 38, :scale => 0
    t.string  "category",          :limit => 12
  end

  create_table "lob_universe_peers_stats_mp", :id => false, :force => true do |t|
    t.string  "marketcap_id_name", :limit => 100
    t.string  "sic",               :limit => 200
    t.integer "premium",                          :precision => 38, :scale => 0
    t.integer "sic_type",                         :precision => 38, :scale => 0
    t.string  "category",          :limit => 12
  end

  create_table "lob_universe_peers_stats_mr", :id => false, :force => true do |t|
    t.string  "marketcap_id_name", :limit => 100
    t.string  "sic",               :limit => 200
    t.integer "rpm",                              :precision => 38, :scale => 0
    t.integer "sic_type",                         :precision => 38, :scale => 0
    t.string  "category",          :limit => 12
  end

  create_table "lob_universe_peers_stats_p", :id => false, :force => true do |t|
    t.string  "revenues_id_name", :limit => 100
    t.string  "sic",              :limit => 200
    t.integer "premium",                         :precision => 38, :scale => 0
    t.integer "sic_type",                        :precision => 38, :scale => 0
    t.string  "category",         :limit => 12
  end

  create_table "lob_universe_peers_stats_r", :id => false, :force => true do |t|
    t.string  "revenues_id_name", :limit => 100
    t.string  "sic",              :limit => 200
    t.integer "rpm",                             :precision => 38, :scale => 0
    t.integer "sic_type",                        :precision => 38, :scale => 0
    t.string  "category",         :limit => 12
  end

  create_table "lookup_tmp", :id => false, :force => true do |t|
    t.string   "lookup_table",                                                       :null => false
    t.string   "lookup_sub_table"
    t.string   "location"
    t.string   "lookup_column",                                                      :null => false
    t.text     "lookup_value"
    t.string   "lookup_link"
    t.string   "lookup_link_location"
    t.string   "topic_sort_order"
    t.integer  "lob_id",                              :precision => 38, :scale => 0, :null => false
    t.integer  "form_id",                             :precision => 38, :scale => 0, :null => false
    t.integer  "seq_number_form",                     :precision => 38, :scale => 0
    t.integer  "insurer_id",                          :precision => 38, :scale => 0
    t.integer  "parent_id",                           :precision => 38, :scale => 0
    t.string   "parent_name"
    t.string   "country_code"
    t.string   "state_code"
    t.string   "suits_brought_in_us"
    t.string   "proprietary"
    t.string   "form_name",            :limit => 400
    t.string   "form_number"
    t.string   "form_edition_date"
    t.string   "comments"
    t.datetime "load_date"
    t.string   "doc_type",             :limit => 1
    t.string   "doc_path",             :limit => 99
    t.string   "doc_name",             :limit => 200
  end

  create_table "mainforms", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "private", :id => false, :force => true do |t|
    t.decimal "mascad_id", :null => false
  end

  create_table "rb_ad_vhierarchies", :force => true do |t|
    t.integer  "company_id", :precision => 38, :scale => 0
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_animals", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.integer  "lft",        :precision => 38, :scale => 0
    t.integer  "rgt",        :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_co_hierarchies", :force => true do |t|
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.integer  "child_id",   :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_companies", :force => true do |t|
    t.integer  "company_id",   :precision => 38, :scale => 0
    t.string   "company_name"
    t.string   "company_type"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "rb_company_hierarchies", :force => true do |t|
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
  end

  create_table "rb_hierarchies", :id => false, :force => true do |t|
    t.integer  "company_id", :precision => 38, :scale => 0
    t.integer  "parent_id",  :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_hierarchy_logs", :force => true do |t|
    t.integer  "company_id", :precision => 38, :scale => 0
    t.string   "log_type"
    t.string   "log_desc"
    t.datetime "log_date"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "rb_schema_migrations", :id => false, :force => true do |t|
    t.string "version", :null => false
  end

  add_index "rb_schema_migrations", ["version"], :name => "rb_unique_schema_migrations", :unique => true

  create_table "rb_tests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ref_amf_rev_ranges", :id => false, :force => true do |t|
    t.integer "company_id",       :precision => 38, :scale => 0
    t.integer "revenue_range_id", :precision => 38, :scale => 0
    t.integer "dbno",             :precision => 38, :scale => 0
  end

  create_table "ref_flip_amf_db_rev_ranges", :id => false, :force => true do |t|
    t.integer "company_id",       :precision => 38, :scale => 0
    t.integer "revenue_range_id", :precision => 38, :scale => 0
  end

  create_table "regulator", :id => false, :force => true do |t|
    t.decimal "mascad_id", :null => false
  end

  create_table "subcompanies", :force => true do |t|
    t.integer  "parentId",       :precision => 38, :scale => 0
    t.string   "subcompanyname"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "test_table", :id => false, :force => true do |t|
    t.integer "numb", :precision => 38, :scale => 0
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tmp_co_info", :id => false, :force => true do |t|
    t.integer "company_id",                         :precision => 38, :scale => 0, :null => false
    t.integer "sales",                              :precision => 38, :scale => 0
    t.integer "revenue_range_id",                   :precision => 38, :scale => 0
    t.string  "revenue_column_name", :limit => 50
    t.string  "revenue_range_desc",  :limit => 50
    t.integer "number_of_employees",                :precision => 38, :scale => 0
    t.string  "sic_code4",           :limit => 4
    t.string  "sic4_desc",           :limit => 200
  end

  create_table "tmp_mascad_cases", :id => false, :force => true do |t|
    t.decimal "mascad_id", :null => false
  end

  create_table "tmp_qrt_mscad_mc", :id => false, :force => true do |t|
    t.decimal  "mascad_id",                      :null => false
    t.decimal  "company_id"
    t.decimal  "gvkey"
    t.string   "iid",              :limit => 10
    t.datetime "filing_date"
    t.decimal  "year"
    t.datetime "loss_start_date"
    t.datetime "loss_end_date"
    t.datetime "date_30da_end"
    t.decimal  "mc_avg_class"
    t.decimal  "mc_30da_end"
    t.decimal  "mc_avg_30da_diff"
    t.string   "quarter",          :limit => 2
    t.string   "madoff",           :limit => 1
    t.string   "subprime",         :limit => 1
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
