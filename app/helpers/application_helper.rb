module ApplicationHelper
  def no_users?
    User.count == 0
  end
  def at_least_one_user?
    not no_users?
  end
end
