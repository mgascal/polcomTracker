class SubmissionTypesController < ApplicationController
  # GET /submission_types
  # GET /submission_types.json
  def index
    @submission_types = SubmissionType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submission_types }
    end
  end

  # GET /submission_types/1
  # GET /submission_types/1.json
  def show
    @submission_type = SubmissionType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission_type }
    end
  end

  # GET /submission_types/new
  # GET /submission_types/new.json
  def new
    @submission_type = SubmissionType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission_type }
    end
  end

  # GET /submission_types/1/edit
  def edit
    @submission_type = SubmissionType.find(params[:id])
  end

  # POST /submission_types
  # POST /submission_types.json
  def create
    @submission_type = SubmissionType.new(params[:submission_type])

    respond_to do |format|
      if @submission_type.save
        format.html { redirect_to @submission_type, notice: 'Submission type was successfully created.' }
        format.json { render json: @submission_type, status: :created, location: @submission_type }
      else
        format.html { render action: "new" }
        format.json { render json: @submission_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /submission_types/1
  # PUT /submission_types/1.json
  def update
    @submission_type = SubmissionType.find(params[:id])

    respond_to do |format|
      if @submission_type.update_attributes(params[:submission_type])
        format.html { redirect_to @submission_type, notice: 'Submission type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submission_types/1
  # DELETE /submission_types/1.json
  def destroy
    @submission_type = SubmissionType.find(params[:id])
    @submission_type.destroy

    respond_to do |format|
      format.html { redirect_to submission_types_url }
      format.json { head :no_content }
    end
  end
  def submissionTypeLists
    code = 403
    msg = "Forbidden"
    @submission_types = {}
    
   
    ssnid = params[:ssnid]
    
    #To do session authentication
    if true
      if !params[:submission_types].nil? && params[:submission_types].length > 0
          @submission_types = SubmissionType.where("lower(SUBMISSION_TYPE) like '%#{params[:submission_types]}%'").order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      else
          @submission_types = SubmissionType.order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      end
      
      if @submission_types.nil?
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
            :total_count => @submission_types.count,
            :submissionTypes => @submission_types
          },
          :status => { :code => code, :message => msg}
        }
     }
    end
    
  end
  
  def createSubmissionType
    @submission_types = SubmissionType.new(params[:submission_type])
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
        if @submission_types.save 
          user = User.find(Session.find_by_session_id(params[:ssnid]).user_id) 
          @submission_types.create_by = user.firstname + ' ' + user.lastname
          @submission_types.create_date = Time.now
          @submission_types.updated_by = user.firstname + ' ' + user.lastname
          @submission_types.updated_date = Time.now
          @submission_types.save
          #format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
          format.html{ head :no_content }
          #format.json { render json: @form, status: :created, location: @form }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :submission_type => @submission_types
              },
              :status => { :code => 200, :message => "Reqeust Successful" }
            } 
          }
        else
          format.html { render action: "new" }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :submission_type => @submission_types
              },
              :status => { :code => 400, :message => @submission_types.errors.messages }
            }
          }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :submission_type => {}
              },
              :status => { :code => 401, :message => "Not Authorized"  }
            }
          }
      end
    end
  end
  
  def getSubmissionType
    code = 403
    msg = "Forbidden"
    @submission_types = {}
    ssnid = params[:ssnid]
    
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      @submission_types = SubmissionType.find(params[:submission_type_id])
       if @submission_types.nil?
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
            :submission_type => @submission_types
          },
          :status => { :code => code, :message => msg }
        }
      }
    end
  end
  
  def updateSubmissionType
    @submission_types = SubmissionType.find(params[:submission_type_id])
    ssnid = params[:ssnid]
    
    code = 200
    msg = "Success"
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
        if @submission_types.update_attributes(params[:submission_type])
           
           user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
           @submission_types.updated_by = user.firstname + ' ' + user.lastname
           @submission_types.updated_date = Time.now
           @submission_types.save
           
           format.json { render json: {
                :params => params.except("controller", "action", "format"),
                :response => {
                    :submission_type => @submission_types
                },
                :status => { :code => code, :message => msg }
              }
           }
        else
            format.html { render action: "edit" }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :submission_type => @submission_types
                  },
                  :status => { :code => 400, :message => @submission_types.errors.messages }
                }
            }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :submission_type => @submission_types
              },
              :status => { :code => 401, :message => "Not Authorized" }
            }
        }
      end
    end
  end
end
