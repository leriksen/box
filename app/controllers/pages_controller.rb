class PagesController < ApplicationController

  rescue_from ActionView::MissingTemplate, with: :invalid_page

  def index
    redirect_to(new_user_registration_path,
                alert: "No users exist yet. Please create Admin user") and return if User.count == 0
  end

  def show
    render params[:id]
  end

  def invalid_page
    redirect_to root_path
  end
end
