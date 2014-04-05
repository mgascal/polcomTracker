class PolicyTypesController < ApplicationController
  # GET /policy_types
  # GET /policy_types.json
  def index
    @policy_types = PolicyType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @policy_types }
    end
  end

  # GET /policy_types/1
  # GET /policy_types/1.json
  def show
    @policy_type = PolicyType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @policy_type }
    end
  end

  # GET /policy_types/new
  # GET /policy_types/new.json
  def new
    @policy_type = PolicyType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @policy_type }
    end
  end

  # GET /policy_types/1/edit
  def edit
    @policy_type = PolicyType.find(params[:id])
  end

  # POST /policy_types
  # POST /policy_types.json
  def create
    @policy_type = PolicyType.new(params[:policy_type])

    respond_to do |format|
      if @policy_type.save
        format.html { redirect_to @policy_type, notice: 'Policy type was successfully created.' }
        format.json { render json: @policy_type, status: :created, location: @policy_type }
      else
        format.html { render action: "new" }
        format.json { render json: @policy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /policy_types/1
  # PUT /policy_types/1.json
  def update
    @policy_type = PolicyType.find(params[:id])

    respond_to do |format|
      if @policy_type.update_attributes(params[:policy_type])
        format.html { redirect_to @policy_type, notice: 'Policy type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @policy_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /policy_types/1
  # DELETE /policy_types/1.json
  def destroy
    @policy_type = PolicyType.find(params[:id])
    @policy_type.destroy

    respond_to do |format|
      format.html { redirect_to policy_types_url }
      format.json { head :no_content }
    end
  end
  
  def policyTypeLists
    code = 403
    msg = "Forbidden"
    @policy_types = {}
    
   
    ssnid = params[:ssnid]
    
    #To do session authentication
    if true
      if !params[:policy_types].nil? && params[:policy_types].length > 0
          @policy_types = PolicyType.where("lower(POLICY_TYPE) like '%#{params[:policy_types]}%'").order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      else
          @policy_types = PolicyType.order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      end
      
      if @policy_types.nil?
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
            :total_count => @policy_types.count,
            :polTypes => @policy_types
          },
          :status => { :code => code, :message => msg}
        }
     }
    end
    
  end
  
  def createPolicyType
    @policy_type = PolicyType.new(params[:policy_type])
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
        if @policy_type.save 
          user = User.find(Session.find_by_session_id(params[:ssnid]).user_id) 
          @policy_type.create_by = user.firstname + ' ' + user.lastname
          @policy_type.create_date = Time.now
          @policy_type.updated_by = user.firstname + ' ' + user.lastname
          @policy_type.updated_date = Time.now
          @policy_type.save
          #format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
          format.html{ head :no_content }
          #format.json { render json: @form, status: :created, location: @form }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :policy_type => @policy_type
              },
              :status => { :code => 200, :message => "Reqeust Successful" }
            } 
          }
        else
          format.html { render action: "new" }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :policy_type => @policy_type
              },
              :status => { :code => 400, :message => @policy_type.errors.messages }
            }
          }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :policy_type => {}
              },
              :status => { :code => 401, :message => "Not Authorized"  }
            }
          }
      end
    end
  end
  
  def getPolicyType
    code = 403
    msg = "Forbidden"
    @policy_type = {}
    ssnid = params[:ssnid]
    
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      @policy_type = PolicyType.find(params[:policy_type_id])
       if @policy_type.nil?
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
            :policy_type => @policy_type
          },
          :status => { :code => code, :message => msg }
        }
      }
    end
  end
  
  def updatePolicyType
    @policy_type = PolicyType.find(params[:policy_type_id])
    ssnid = params[:ssnid]
    
    code = 200
    msg = "Success"
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
        if @policy_type.update_attributes(params[:policy_type])
           
           user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
           @policy_type.updated_by = user.firstname + ' ' + user.lastname
           @policy_type.updated_date = Time.now
           @policy_type.save
           format.json { render json: {
                :params => params.except("controller", "action", "format"),
                :response => {
                    :policy_type => @policy_type
                },
                :status => { :code => code, :message => msg }
              }
           }
        else
            format.html { render action: "edit" }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :policy_type => @policy_type
                  },
                  :status => { :code => 400, :message => @policy_type.errors.messages }
                }
            }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :policy_type => @policy_type
              },
              :status => { :code => 401, :message => "Not Authorized" }
            }
        }
      end
    end
  end
  
end
