class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    #@form = Form.find(params[:id])
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if params[:commit] == "Save" && @form.save
        user = User.find(Session.find_by_session_id(params[:ssnid]).user_id) 
        @form.create_by = user.firstname + ' ' + user.lastname
        @form.create_date = Time.now
        @form.updated_by = user.firstname + ' ' + user.lastname
        @form.updated_date = Time.now
        @form.save
        format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
        format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    code = 403
    msg = "Forbidden"
    @form = Form.find(params[:id])
    ssnid = params[:ssnid]
    
    if locked? @form
      user = User.find(LockedForm.find_by_ksq_seq_no(@form.id).user_id)
      locked_by = "#{user.firstname} #{user.lastname}"
      locked = true
    elsif Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      Proprietary.delete_all(:ksq_seq_no => @form.id)
      @form.destroy
      code = 200
      msg = "Reqeust Successful"
    else
      code = 401
      msg = "Not Authorized"
    end

    respond_to do |format|
      format.html { redirect_to search_url }
      format.json { render json: {
          :params => params.except("controller", "action", "format"),
          :response => { :locked => {
              :locked => locked, :locked_by => locked_by
            }
          },
          :status => { :code => code, :message => msg }
        }
     }
    end
  end
  
  def search
    
  end
  
  def searchForms
    
    code = 403
    msg = "Forbidden"
    @forms = {}
    
   
    ssnid = params[:ssnid]
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
        if !params[:searchVal].nil? && params[:searchVal].length > 0
            #@forms = Form.where( (is_numeric? params[:searchVal]) ? "#{params[:searchOpt]} = #{params[:searchVal]}" : "lower(#{params[:searchOpt]}) like '%#{params[:searchVal].downcase}%' ")
            #@forms = Form.where(params.except("controller", "action", "format", "ssnid", "searchOpt", "searchVal").map{ |k,v| 
              #"#{k} = " + ((Integer(v) rescue nil).nil? ? "'#{v}'" : "#{v}")
            #  (is_numeric? v) ? "#{k} = #{v}" : "lower(#{k}) like '%#{v.downcase}%'"
            #}.join(" AND ") + params[:searchOpt] + " = " + params[:searchVal])
            sql = "select * from (
                      select   f.KSQ_SEQ_NO,
                            f.FORM_ID, 
                            f.REVISED_ITEM_NO, 
                            s.STATUS, 
                            f.POLICY_NAME, 
                            f.LOB, 
                            d.DOCUMENT_TYPE as TYPE_OF_DOCUMENT, 
                            p.POLICY_TYPE as TYPE_OF_POLICY, 
                            TO_CHAR(f.MAPPING_COMPLETED, 'MM/DD/YYYY') AS MAPPING_COMPLETED, 
                            TO_CHAR(f.PARSING_COMPLETED, 'MM/DD/YYYY') AS PARSING_COMPLETED,
                            TO_CHAR(f.LOADED, 'MM/DD/YYYY') AS LOADED
                    from FORM_TRACKING f
                      LEFT JOIN FORM_TRACKING_STATUS s on f.status = s.status_id
                      LEFT JOIN FORM_TRACKING_TYPE_OF_DOCUMENT d on f.TYPE_OF_DOCUMENT= d.DOCUMENT_TYPE_id
                      LEFT JOIN FORM_TRACKING_TYPE_OF_POLICY p on f.TYPE_OF_POLICY = p.POLICY_TYPE_id
                    where " + ((is_numeric? params[:searchVal]) ? "#{params[:searchOpt]} like '%#{params[:searchVal]}%'" : "lower(#{params[:searchOpt]}) like '%#{params[:searchVal].downcase}%'") + "
                    and  rownum <= 25  )
                    ORDER BY " + params[:sortColumn] + " " + ((params[:sortAsc] == "false") ? "DESC" : "ASC")
                    
            
            @forms = ActiveRecord::Base.connection.execute(sql)
            
        else
            #@forms = Form.order('UPDATED_DATE DESC').limit(50)
            sql = "select * from (
                      select   f.KSQ_SEQ_NO,
                            f.FORM_ID, 
                            f.REVISED_ITEM_NO, 
                            s.STATUS, 
                            f.POLICY_NAME, 
                            f.LOB, 
                            d.DOCUMENT_TYPE as TYPE_OF_DOCUMENT, 
                            p.POLICY_TYPE as TYPE_OF_POLICY, 
                            TO_CHAR(f.MAPPING_COMPLETED, 'MM/DD/YYYY') AS MAPPING_COMPLETED, 
                            TO_CHAR(f.PARSING_COMPLETED, 'MM/DD/YYYY') AS PARSING_COMPLETED,
                            TO_CHAR(f.LOADED, 'MM/DD/YYYY') AS LOADED
                    from FORM_TRACKING f
                      LEFT JOIN FORM_TRACKING_STATUS s on f.status = s.status_id
                      LEFT JOIN FORM_TRACKING_TYPE_OF_DOCUMENT d on f.TYPE_OF_DOCUMENT= d.DOCUMENT_TYPE_id
                      LEFT JOIN FORM_TRACKING_TYPE_OF_POLICY p on f.TYPE_OF_POLICY = p.POLICY_TYPE_id
                     where  rownum <= 25 )
                     ORDER BY " + params[:sortColumn] + " " + ((params[:sortAsc] == "false") ? "DESC" : "ASC")
            
            @forms = ActiveRecord::Base.connection.exec_query(sql)
        end    
        
        if @forms.nil?
          code = 400
          msg = "Bad Reqeust"
        else
          code = 200
          msg = "Reqeust Successful"
        end
        #logger.info @forms
      
    else
        code = 401
        msg = "Not Authorized"
    end

    respond_to do |format|
      format.json { render json: {
          :params => params.except("controller", "action", "format"),
          :response => {
            :total_count => @forms.count,
            :forms => @forms
          },
          :status => { :code => code, :message => msg}
        }
     }
    end
    
  end
  
  def is_numeric?(i)
    i.to_i.to_s == i || i.to_f.to_s == i
  end
  
  def getFormDetails
    
    code = 403
    msg = "Forbidden"
    @form = {}
    
    ssnid = params[:ssnid]
    
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      @form = Form.find(params[:ksq_seq_no])
      
      prop = Proprietary.find_all_by_ksq_seq_no(params[:ksq_seq_no])
      mem = ""
      prop.each do |p|
        mem += p.membership + ";"
      end 
      
      
      if @form.nil?
        code = 400
        msg = "Bad Reqeust"
      else
        code = 200
        msg = "Reqeust Successful"
      end
    else
        code = 401
        msg = "Not Authorized"  
    end
    
    respond_to do |format|
      format.json { render json: {
          :params => params.except("controller", "action", "format"),
          :response => {
            :form => @form,
            :proprietary => mem
          },
          :status => { :code => code, :message => msg }
        }
     }
    end
  end
  
  def updateForm
    #logger.info "????????????????????????????????????????????????????????????????"
    #logger.info params[:form]
    #logger.info params[:KSQ_SEQ_NO]
    
    @form = Form.find(params[:ksq_seq_no])
    commit = params[:commit]
    ssnid = params[:ssnid]
    
    if( (!params[:form][:lob].nil?) && params[:form][:lob].length > 0)
      params[:form][:lob] = params[:form][:lob].join(",")
    end
    
    deleteLocked @form, ssnid
    
    respond_to do |format|
      #format.html { redirect_to search_path, notice: 'Form was successfully updated.' }
      if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
          if commit == "Save" && @form.update_attributes(params[:form].except("proprietary"))
            
            # to do update prop
            user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
            @form.updated_by = user.firstname + ' ' + user.lastname
            @form.updated_date = Time.now
            @form.save
            
            Proprietary.delete_all(:ksq_seq_no => @form.id)
            if params[:form][:proprietary].length > 0
              params[:form][:proprietary].split(";").each do |p|
                prop = Proprietary.new
                prop.ksq_seq_no = @form.id
                prop.membership = p
                prop.save
              end
            end
            
            format.html { redirect_to edit_form_path(:id => @form.id, :searchValue => params[:searchValue]), notice: 'Form was successfully updated.' }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :form => @form
                  },
                  :status => { :code => 200, :message => "Reqeust Successful" }
                }
            }
          elsif commit == "Cancel"
            deleteLocked @form, params[:ssnid]
            #(:searchVal => params[:srchField], :searchOpt => params[:srchValue])
            format.html { redirect_to search_path}
            format.json { head :no_content }
          else
            deleteLocked @form, params[:ssnid]
            format.html { render action: "edit" }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :form => @form
                  },
                  :status => { :code => 400, :message => "Bad Reqeust" }
                }
            }
          end
      else
         deleteLocked @form, params[:ssnid]
         format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :form => @form
              },
              :status => { :code => 401, :message => "Not Authorized" }
            }
        }
      end
    end 
  end
  
  def checkoutForm
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
      @form = Form.find(params[:ksq_seq_no])
      
      if @form.nil?
        code = 400
        msg = "Bad Reqeust"
      else
        code = 200
        msg = "Reqeust Successful"
        
        locked = true
        if !locked? @form
          lock = LockedForm.new
          lock.ksq_seq_no = @form.id
          lock.user_id =  Session.find_by_session_id(params[:ssnid]).user_id
          lock.session_id = params[:ssnid] 
          lock.save
          
          locked = false
        else
          user = User.find(LockedForm.find_by_ksq_seq_no(@form.id).user_id)
          locked_by = "#{user.firstname} #{user.lastname}"
        end
      end 
    else 
      code = 401
      msg = "Not Authorized"  
    end
    
    respond_to do |format|
      format.json { render json: {
          :params => params.except("controller", "action", "format"),
          :response => {
            :locked=> { :locked => locked, :locked_by => locked_by },
            :form => @form.form_id
          },
          :status => { :code => code, :message => msg }
        }
     }
    end
    
  end
  
  def locked? (form)
    
    l = LockedForm.find_by_ksq_seq_no(@form.id)
    !l.nil?
  end
  
  def createForm
    
    if((!params[:form][:lob].nil?)  && params[:form][:lob].length > 0)
      params[:form][:lob] = params[:form][:lob].join(",")
    end
    
    params[:form][:edition_date] = to_date(params[:form][:edition_date])
    params[:form][:date_received] = to_date(params[:form][:date_received])
    params[:form][:due_date] = to_date(params[:form][:due_date])
    params[:form][:mapping_completed] = to_date(params[:form][:mapping_completed])
    params[:form][:parsing_completed] = to_date(params[:form][:parsing_completed])
    params[:form][:loaded] = to_date(params[:form][:loaded])
    params[:form][:client_notified] = to_date(params[:form][:client_notified])

    @form = Form.new(params[:form].except("proprietary"))
     
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
        if params[:commit] == "Save" && @form.save 
          user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
          
          if params[:form][:proprietary].length > 0
            params[:form][:proprietary].split(";").each do |p|
              prop = Proprietary.new
              prop.ksq_seq_no = @form.id
              prop.membership = p
              prop.save
            end
          end 
             
          @form.create_by = user.firstname + ' ' + user.lastname
          @form.create_date = Time.now
          @form.updated_by = user.firstname + ' ' + user.lastname
          @form.updated_date = Time.now
          @form.save
          
          #format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
          format.html{ head :no_content }
          #format.json { render json: @form, status: :created, location: @form }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :form => @form
              },
              :status => { :code => 200, :message => "Reqeust Successful" }
            } 
          }
        else
          format.html { render action: "new" }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :form => @form
              },
              :status => { :code => 400, :message => "Bad Reqeust" }
            }
          }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :form => {}
              },
              :status => { :code => 401, :message => "Not Authorized"  }
            }
          }
      end
    end
  end
  
  def deleteLocked (form, ssnid)
    
    LockedForm.delete_all(:ksq_seq_no => form.id, :session_id => ssnid)
  end
  
  def unlockedForm
    
    @form = Form.find_by_ksq_seq_no(params[:ksq_seq_no])
    deleteLocked @form, params[:ssnid]
    
    respond_to do |format|
      format.json{ head :no_content }
    end
  end
  
  def copyForm
    @form = Form.find(params[:ksq_seq_no])
    
    @new_form = {}
    code = 403
    msg = "Forbidden"
    
    if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
      user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
      
      @new_form = @form.dup
      @new_form.create_by = user.firstname + ' ' + user.lastname
      @new_form.create_date = Time.now
      @new_form.updated_by = user.firstname + ' ' + user.lastname
      @new_form.updated_date = Time.now
      @new_form.save
      
      code = 200
      msg = "Reqeust Successful" 
    else
      code = 401
      msg = "Not Authorized"       
    end
    
    respond_to do |format|
      format.json { render json: {
            :params => params.except("controller", "action", "format"),
            :response => {
              :form => @new_form
            },
            :status => { :code => code, :message => msg }
          } 
        }
    end
  end
  
  def copy
    
  end
  
  def generateReport
    
  end
  
  def excelDownload
    
    dateFrom = params[:dateFrom]
    dateTo = params[:dateTo]
    filterBy = params[:filterBy]
    sql = "select   TO_CHAR(f.DATE_RECEIVED, 'MM/DD/YYYY') AS DATE_RECEIVED,
                    f.POLICY_NAME, 
                    d.DOCUMENT_TYPE as TYPE_OF_DOCUMENT, 
                    sm.SUBMISSION_TYPE as TYPE_OF_SUBMISSION,
                    p.POLICY_TYPE as TYPE_OF_POLICY, 
                    TO_CHAR(f.MAPPING_COMPLETED, 'MM/DD/YYYY') AS ANALYZED,
                    TO_CHAR(f.PARSING_COMPLETED, 'MM/DD/YYYY') AS PARSED, 
                    TO_CHAR(f.LOADED, 'MM/DD/YYYY') AS LOADED,  
                    case
                      when s.STATUS = 'Closed' 
                        then 'Closed'
                      else ''
                    end as CLOSED
            from FORM_TRACKING f
              LEFT JOIN FORM_TRACKING_STATUS s on f.status = s.status_id
              LEFT JOIN FORM_TRACKING_TYPE_OF_DOCUMENT d on f.TYPE_OF_DOCUMENT= d.DOCUMENT_TYPE_id
              LEFT JOIN FORM_TRACKING_TYPE_OF_POLICY p on f.TYPE_OF_POLICY = p.POLICY_TYPE_id
              LEFT JOIN FORM_TRACKING_TYPE_SUBMISSION sm on f.TYPE_OF_SUBMISSION = sm.SUBMISSION_TYPE_ID
                where f.#{filterBy} between TO_DATE('#{dateFrom} 00:00:00','MM/DD/YYYY HH24:MI:SS') and TO_DATE('#{dateTo} 23:59:59','MM/DD/YYYY HH24:MI:SS')
              ORDER BY f.DATE_RECEIVED"
            
    @forms = ActiveRecord::Base.connection.exec_query(sql) #temp
    
    respond_to do |format|
      format.json { render json: {
          :params => params.except("controller", "action", "format"),
          :response => {
            :forms => @forms
          },
          :status => { :code => 200, :message => "Reqeust Successful" }
        } 
      }
      format.xlsx{
        file_path = createExcel(@forms) 
        send_file file_path, :x_sendfile => true
      }
    end
    
  end
  
  def createExcel(forms)
    
    require 'axlsx'
    require 'date'
    
    ssnid = "asdaskdjadfjgjwuriwek"
    
    path = ['tmp', 'downloads', 'excel']
    directory = Rails.root
    
    counter = 0
    path.each do |p|
      directory = create_directory_if_not_exists("#{directory}/#{p}")
    end
    
    directory = create_directory_if_not_exists( "#{directory}/#{Time.now.strftime("%Y-%m-%d")}/")
    filename = directory + "report_#{Time.now.strftime("%H%M%S")}_#{session[:session_id] }.xlsx"
    
    p = Axlsx::Package.new
    wb = p.workbook
    head = wb.styles.add_style  :b => true, 
                                :bg_color => "BFBFBF",
                                :alignment => { 
                                          :horizontal => :center,
                                          :vertical => :center
                                }
    formatDate1 = wb.styles.add_style :format_code => "mmmm d, yyyy", 
                                      :alignment => { 
                                          :horizontal => :right,
                                          :vertical => :top
                                      }
    formatDate2 = wb.styles.add_style :format_code => "d-mmm", 
                                      :alignment => { 
                                          :horizontal => :center,
                                          :vertical => :top
                                      }
    text = wb.styles.add_style :alignment => { 
                                          :horizontal => :left,
                                          :vertical => :top
                                      }
    
    wb.add_worksheet(:name => "PolCom Tracking Report") do |sheet|
      sheet.add_row ['Date Received', 'Policy Name', 'Type of Document', 'Type of Submission', 'Type of Policy', 'Analyzed', 'Parsed', 'Loaded', 'Closed'], :style => head
      prevDate = ""
      forms.each do |form|
        if (form["date_received"] != prevDate)
          if(counter == 0)
            sheet.add_row [""], :height => 7
          else
            sheet.add_row [""]
          end
        end
        sheet.add_row [ (form["date_received"] == prevDate) ? "" : (form["date_received"]), form["policy_name"], form["type_of_document"], form["type_of_submission"], form["type_of_policy"], form["analyzed"], form["parsed"], form["loaded"], form["closed"] ],
                     :style => [formatDate1, text, text, text, text, formatDate2, formatDate2, formatDate2, text]
        
        prevDate = form["date_received"]
        counter = counter + 1
      end
      
    end
    p.serialize(filename)
    
    filename
    
  end
   
  def to_date(d)
    ret = ""
    
    if !d.nil?
      ret = Date::strptime(d,'%m/%d/%Y')
    end
    
    ret
  end
  
  def create_directory_if_not_exists(directory_name)
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    directory_name
  end
end
