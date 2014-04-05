class StatusesController < ApplicationController
  # GET /statuses
  # GET /statuses.json
  def index
    @statuses = Status.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.json
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = Status.new(params[:status])

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render json: @status, status: :created, location: @status }
      else
        format.html { render action: "new" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.json
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status])
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to statuses_url }
      format.json { head :no_content }
    end
  end
  
  def statusLists
    code = 403
    msg = "Forbidden"
    @statuses = {}
    
   
    ssnid = params[:ssnid]
    
    #sortColumn, sortAsc
    #To do session authentication
    if true
      if !params[:status].nil? && params[:status].length > 0
          @statuses = Status.where("lower(STATUS) like '%#{params[:status]}%'").order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      else
          #@statuses = Status.order(params[:sortColumn] + ((params[:sortAsc]== "true")? " ASC" : " DESC"));
          @statuses = Status.order(params[:sortColumn] + ((params[:sortAsc] == "false") ? " DESC" : " ASC"))
      end
      
      if @statuses.nil?
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
            :total_count => @statuses.count,
            :statuses => @statuses
          },
          :status => { :code => code, :message => msg}
        }
     }
    end
    
  end
  
  def getTrackingStatus
    code = 403
    msg = "Forbidden"
    @status = {}
    ssnid = params[:ssnid]
    
    #To do session authentication
    if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
      @status = Status.find(params[:status_id])
       if @status.nil?
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
            :status => @status
          },
          :status => { :code => code, :message => msg }
        }
      }
    end
  end
  
  def updateTrackingStatus
    @status = Status.find(params[:status_id])
    ssnid = params[:ssnid]
    
    code = 200
    msg = "Success"
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{ssnid}'").length > 0
        if @status.update_attributes(params[:status])
           
           user = User.find(Session.find_by_session_id(params[:ssnid]).user_id)
           @status.updated_by = user.firstname + ' ' + user.lastname
           @status.updated_date = Time.now
           @status.save
           format.json { render json: {
                :params => params.except("controller", "action", "format"),
                :response => {
                    :status => @status
                },
                :status => { :code => code, :message => msg }
              }
           }
        else
            format.html { render action: "edit" }
            format.json { render json: {
                  :params => params.except("controller", "action", "format"),
                  :response => {
                    :status => @status
                  },
                  :status => { :code => 400, :message => @status.errors.messages }
                }
            }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :status => @status
              },
              :status => { :code => 401, :message => "Not Authorized" }
            }
        }
      end
    end
  end
  
  def createStatus
    
    @status = Status.new(params[:status])
    
    respond_to do |format|
      if Session.where("status = 'Active' and session_id = '#{params[:ssnid]}'").length > 0
        if @status.save 
          user = User.find(Session.find_by_session_id(params[:ssnid]).user_id) 
          @status.create_by = user.firstname + ' ' + user.lastname
          @status.create_date = Time.now
          @status.updated_by = user.firstname + ' ' + user.lastname
          @status.updated_date = Time.now
          @status.save
          #format.html { redirect_to edit_form_path(@form), notice: 'Form was successfully created.' }
          format.html{ head :no_content }
          #format.json { render json: @form, status: :created, location: @form }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :status => @status
              },
              :status => { :code => 200, :message => "Reqeust Successful" }
            } 
          }
        else
          format.html { render action: "new" }
          format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :status => @status
              },
              :status => { :code => 400, :message => @status.errors.messages }
            }
          }
        end
      else
        format.json { render json: {
              :params => params.except("controller", "action", "format"),
              :response => {
                :status => {}
              },
              :status => { :code => 401, :message => "Not Authorized"  }
            }
          }
      end
    end
  end
end
