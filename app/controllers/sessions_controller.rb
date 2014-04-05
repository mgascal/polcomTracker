class SessionsController < ApplicationController

  def new
    #@session = Session.new
  end

  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id 
      redirect_to search_path, :notice => "Logged in!" #new_mainform_path

      #save to session table
      endSessionByUserId(user.id)
      @session = Session.new(params[:user_id])
      @session[:user_id] = user.id
      @session[:session_id] = request.session_options[:id]
      @session[:time_started] = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      @session[:status] = 'Active'
      @session.save      
    else    
      redirect_to :controller => "homepage", :action => "login", :error => "yes"
    end
  end

  def deleteSession(sessionid)
    LockedForm.delete_all(:session_id => sessionid.session_id)
    Session.delete_all(:session_id => sessionid.session_id)
  end

  def logoutSession(userId)
    LockedForm.delete_all(:user_id => userId.user_id)
    Session.delete_all(:user_id => userId.user_id)
  end
  
  def endSessionByUserId(userId)
    LockedForm.delete_all(:user_id => userId)
    Session.delete_all(:user_id => userId)
  end

  def endSession
    @session = Session.find_by_session_id(params[:session_id])
    deleteSession @session

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def destroy
    @session = Session.find_by_user_id(params[:user_id])
    logoutSession @session

    session[:user_id] = nil    
    reset_session
    
    respond_to do |format|
      format.json { head :no_content }
    end 
  end

end
