# somewhat static pages - still routed and use HAML/SASS, just no ActiveRecord interaction
class PagesController < ApplicationController

  helper ApplicationHelper

  rescue_from ActionView::MissingTemplate, with: :invalid_page

  def index
    redirect_to(
      new_user_registration_path,
      alert: "No users exist yet. Please create master admin user"
    ) and return if view_context.no_users?
  end

  def show
    render params[:id]
  end

  def invalid_page
    redirect_to root_path
  end
end
