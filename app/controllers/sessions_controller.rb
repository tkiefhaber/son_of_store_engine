class SessionsController < ApplicationController
  def show
  end

  def create
    user = lookup_by_email_or_username(params[:account_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      new_session
    else
      flash.now.alert = "Email or password is invalid."
      render "new"
    end
  end

  def new_session
    store = Store.find_by_id(session[:checkout_store_id]) rescue nil
    if session[:request_page].blank? && checking_out? && store
      redirect_to new_store_order_path(store), notice: "Logged in!"
    elsif session[:request_page].blank?
      redirect_to root_url, notice: "Logged in!"
    else
      plain_login
    end
  end

  def destroy
    session.clear
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Logged out!" }
    end
  end

  private

  def plain_login
    new_session = session[:request_page]
    session[:request_page] = nil
    redirect_to new_session, notice: "Logged in!"
  end

  def lookup_by_email_or_username(account_name)
    user = User.find_by_email(account_name)
    if user.nil?
      user = User.find_by_username(account_name)
    end
    user
  end
end
