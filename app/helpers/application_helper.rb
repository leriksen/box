module ApplicationHelper
  def no_users?
    User.count == 0
  end
end
