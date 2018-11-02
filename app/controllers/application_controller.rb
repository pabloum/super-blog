class ApplicationController < ActionController::Base
  def private_access
    redirect_to :new_user_session unless signed_in?
  end

  def public_access
    redirect_to root_path if signed_in?
  end
end
