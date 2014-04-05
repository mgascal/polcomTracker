class LockedFormsController < ApplicationController
  # GET /locked_forms
  # GET /locked_forms.json
  def index
    @locked_forms = LockedForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locked_forms }
    end
  end

  # GET /locked_forms/1
  # GET /locked_forms/1.json
  def show
    @locked_form = LockedForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @locked_form }
    end
  end

  # GET /locked_forms/new
  # GET /locked_forms/new.json
  def new
    @locked_form = LockedForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @locked_form }
    end
  end

  # GET /locked_forms/1/edit
  def edit
    @locked_form = LockedForm.find(params[:id])
  end

  # POST /locked_forms
  # POST /locked_forms.json
  def create
    @locked_form = LockedForm.new(params[:locked_form])

    respond_to do |format|
      if @locked_form.save
        format.html { redirect_to @locked_form, notice: 'Locked form was successfully created.' }
        format.json { render json: @locked_form, status: :created, location: @locked_form }
      else
        format.html { render action: "new" }
        format.json { render json: @locked_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locked_forms/1
  # PUT /locked_forms/1.json
  def update
    @locked_form = LockedForm.find(params[:id])

    respond_to do |format|
      if @locked_form.update_attributes(params[:locked_form])
        format.html { redirect_to @locked_form, notice: 'Locked form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @locked_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locked_forms/1
  # DELETE /locked_forms/1.json
  def destroy
    @locked_form = LockedForm.find(params[:id])
    @locked_form.destroy

    respond_to do |format|
      format.html { redirect_to locked_forms_url }
      format.json { head :no_content }
    end
  end
end
