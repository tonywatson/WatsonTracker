class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to tasks_path and return }
      else
        format.html { render :action => 'new' }
      end
    end

  end
  
end
