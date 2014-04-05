class DocumentTypesController < ApplicationController
  # GET /document_types
  # GET /document_types.json
  def index
    @document_types = DocumentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @document_types }
    end
  end

  # GET /document_types/1
  # GET /document_types/1.json
  def show
    @document_type = DocumentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document_type }
    end
  end

  # GET /document_types/new
  # GET /document_types/new.json
  def new
    @document_type = DocumentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document_type }
    end
  end

  # GET /document_types/1/edit
  def edit
    @document_type = DocumentType.find(params[:id])
  end

  # POST /document_types
  # POST /document_types.json
  def create
    @document_type = DocumentType.new(params[:document_type])

    respond_to do |format|
      if @document_type.save
        format.html { redirect_to @document_type, notice: 'Document type was successfully created.' }
        format.json { render json: @document_type, status: :created, location: @document_type }
      else
        format.html { render action: "new" }
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /document_types/1
  # PUT /document_types/1.json
  def update
    @document_type = DocumentType.find(params[:id])

    respond_to do |format|
      if @document_type.update_attributes(params[:document_type])
        format.html { redirect_to @document_type, notice: 'Document type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_types/1
  # DELETE /document_types/1.json
  def destroy
    @document_type = DocumentType.find(params[:id])
    @document_type.destroy

    respond_to do |format|
      format.html { redirect_to document_types_url }
      format.json { head :no_content }
    end
  end
  
  def documentTypeLists
    code = 403
    msg = "Forbidden"
    @document_types = {}
    
   
    ssnid = params[:ssnid]
    
    #To do session authentication
    if true
      if !params[:document_types].nil? && params[:document_types].length > 0
          @document_types = DocumentType.where("lower(DOCUMENT_TYPE) like '%#{params[:document_types]}%'").order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      else
          @document_types = DocumentType.order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      end
      
      if @document_types.nil?
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
            :total_count => @document_types.count,
            :docTypes => @document_types
          },
          :status => { :code => code, :message => msg}
        }
     }
    end
    
  end
  
  def createDocumentType
    @document_types = DocumentType.new(params[:document_type])
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
        if @document_types.save 
          user = User.find(Session.find_by_session_id(params[:ssnid]).user_id) 
          @document_types.create_by = user.firstname + ' ' + user.lastname
          @document_types.create_date = Time.now
          @document_types.updated_by = user.firstname + ' ' + user.lastname
          @document_types.updated_date = Time.now
          @document_types.save
          #format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
          format.html{ head :no_content }
          #format.json { render json: @form, status: :created, location: @form }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :document_type => @document_types
              },
              :status => { :code => 200, :message => "Reqeust Successful" }
            } 
          }
        else
          format.html { render action: "new" }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :document_type => @document_types
              },
              :status => { :code => 400, :message => @document_types.errors.messages }
            }
          }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :document_type => {}
              },
              :status => { :code => 401, :message => "Not Authorized"  }
            }
          }
      end
    end
  end
  
  def getDocumentType
    code = 403
    msg = "Forbidden"
    @document_types = {}
    ssnid = params[:ssnid]
    
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      @document_types = DocumentType.find(params[:document_type_id])
       if @document_types.nil?
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
            :document_type => @document_types
          },
          :status => { :code => code, :message => msg }
        }
      }
    end
  end
  
  def updateDocumentType
    @document_types = DocumentType.find(params[:document_type_id])
    ssnid = params[:ssnid]
    
    code = 200
    msg = "Success"
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
        if @document_types.update_attributes(params[:document_type])
           
           user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
           @document_types.updated_by = user.firstname + ' ' + user.lastname
           @document_types.updated_date = Time.now
           @document_types.save
           format.json { render json: {
                :params => params.except("controller", "action", "format"),
                :response => {
                    :document_type => @document_types
                },
                :status => { :code => code, :message => msg }
              }
           }
        else
            format.html { render action: "edit" }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :document_type => @document_types
                  },
                  :status => { :code => 400, :message => @document_types.errors.messages }
                }
            }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :document_type => @document_types
              },
              :status => { :code => 401, :message => "Not Authorized" }
            }
        }
      end
    end
  end
end
