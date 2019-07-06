module ApplicationHelper

  def current_user?(user)
     user == current_user
  end

  def takuman?(user)
    user.nickname == "TakumaN_me"
  end

end
