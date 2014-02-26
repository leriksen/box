module ApplicationHelper
  def no_users?
    User.count == 0
  end

  def at_least_one_user?
    not no_users?
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
