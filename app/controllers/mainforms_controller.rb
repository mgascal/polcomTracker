class MainformsController < ApplicationController
  # GET /mainforms
  # GET /mainforms.json
  def index
    @mainforms = Mainform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mainforms }
    end
  end

  # GET /mainforms/1
  # GET /mainforms/1.json
  def show
    @mainform = Mainform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mainform }
    end
  end

  # GET /mainforms/new
  # GET /mainforms/new.json
  def new
    @mainform = Mainform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mainform }
    end
  end

  # GET /mainforms/1/edit
  def edit
    @mainform = Mainform.find(params[:id])
  end

  # POST /mainforms
  # POST /mainforms.json
  def create
    @mainform = Mainform.new(params[:mainform])

    respond_to do |format|
      if @mainform.save
        format.html { redirect_to @mainform, notice: 'Mainform was successfully created.' }
        format.json { render json: @mainform, status: :created, location: @mainform }
      else
        format.html { render action: "new" }
        format.json { render json: @mainform.errors, status: :unprocessable_entity }
      end
    end
  end

  def showsessions   
    @mainform = Mainform.all
    @sessions = Session.find_all_by_status("Active")

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @session }
    end

    # respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @mainforms }
    #end
  end


  def showusers   
    @mainform = Mainform.all
    @users = User.all

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render json: @session }
    end

    # respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @mainforms }
    #end
  end


  # PUT /mainforms/1
  # PUT /mainforms/1.json
  def update
    @mainform = Mainform.find(params[:id])

    respond_to do |format|
      if @mainform.update_attributes(params[:mainform])
        format.html { redirect_to @mainform, notice: 'Mainform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mainform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainforms/1
  # DELETE /mainforms/1.json
  def destroy
    @mainform = Mainform.find(params[:id])
    @mainform.destroy

    respond_to do |format|
      format.html { redirect_to mainforms_url }
      format.json { head :no_content }
    end
  end
  
  def code401
  end
 
end
