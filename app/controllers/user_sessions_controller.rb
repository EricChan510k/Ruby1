class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
 
  def new
    @user_session = UserSession.new
  end
 
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      # flash[:notice] = t('controllers.user_sessions.create.notice')
      redirect_back_or_default root_url
    else
      flash.now[:error] = t('controllers.user_sessions.create.error')
      render :action => :new
    end
  end
 
  def destroy
    current_user_session.destroy
    # flash[:notice] = t('controllers.user_sessions.destroy.notice')
    redirect_back_or_default login_url
  end
end
