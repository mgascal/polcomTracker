class ProprietariesController < ApplicationController
  # GET /proprietaries
  # GET /proprietaries.json
  def index
    @proprietaries = Proprietary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proprietaries }
    end
  end

  # GET /proprietaries/1
  # GET /proprietaries/1.json
  def show
    @proprietary = Proprietary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proprietary }
    end
  end

  # GET /proprietaries/new
  # GET /proprietaries/new.json
  def new
    @proprietary = Proprietary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proprietary }
    end
  end

  # GET /proprietaries/1/edit
  def edit
    @proprietary = Proprietary.find(params[:id])
  end

  # POST /proprietaries
  # POST /proprietaries.json
  def create
    @proprietary = Proprietary.new(params[:proprietary])

    respond_to do |format|
      if @proprietary.save
        format.html { redirect_to @proprietary, notice: 'Proprietary was successfully created.' }
        format.json { render json: @proprietary, status: :created, location: @proprietary }
      else
        format.html { render action: "new" }
        format.json { render json: @proprietary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proprietaries/1
  # PUT /proprietaries/1.json
  def update
    @proprietary = Proprietary.find(params[:id])

    respond_to do |format|
      if @proprietary.update_attributes(params[:proprietary])
        format.html { redirect_to @proprietary, notice: 'Proprietary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proprietary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proprietaries/1
  # DELETE /proprietaries/1.json
  def destroy
    @proprietary = Proprietary.find(params[:id])
    @proprietary.destroy

    respond_to do |format|
      format.html { redirect_to proprietaries_url }
      format.json { head :no_content }
    end
  end
end
