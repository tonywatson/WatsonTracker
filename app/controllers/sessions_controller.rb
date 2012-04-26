class SessionsController < ApplicationController
  
  def new
    @page_title = "Account Login"
    @user_session = UserSession.new
    redirect_to tasks_path unless @user_session.blank?
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_back_or_default params[:return_to] || tasks_path
      return
    elsif @user_session.errors.messages[:email_address].first == "is not valid"
      @user = User.create(:email_address => params[:user_session][:email_address], :password => params[:user_session][:password])
      render new_user_path unless @user.errors.messages.blank?
      redirect_to tasks_path if @user_session.save && @user.errors.messages.blank?
    else
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy unless current_user_session.blank?
    redirect_to new_session_path and return
  end
  
end
