class Admin::StoresController < ApplicationController
  before_filter :admin_required
  before_filter :find_store, except: [:index]

  def index
    @users = User.joins(:stores).uniq
  end

  def approve
    @store.approve!
    redirect_to admin_stores_path, notice: "#{@store.name} Approved"
  end

  def decline
    @store.decline!
    redirect_to admin_stores_path, notice: "#{@store.name} Declined"
  end

  def enable
    @store.enable!
    redirect_to admin_stores_path, notice: "#{@store.name} Enabled"
  end

  def disable
    @store.disable!
    redirect_to admin_stores_path, notice: "#{@store.name} Disabled"
  end

  def edit
  end

  private

  def find_store
    @store = Store.find_by_slug(params[:id])
  end

end
