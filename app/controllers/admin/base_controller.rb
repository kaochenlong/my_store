class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only!

  private
  def admin_only!
    redirect_to root_path, notice:'your access is not allowed!' unless current_user.is_admin?
  end
end
