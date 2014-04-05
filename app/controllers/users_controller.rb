class UsersController < ApplicationController
	def adduser
	end

  def cancel
  end
  
	def new
  		@user = User.new
 	end

  def initial
    self[0,1]
  end

 	def create
  		@user = User.new(params[:user])
   		if @user.save
    		redirect_to showusers_url, :notice => "Signed up!"
   		else
    		render "new"
   		end
 	end
end
