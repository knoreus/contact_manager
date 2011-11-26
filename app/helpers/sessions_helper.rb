module SessionsHelper
  def login_user(user)
    session[:user_id] = user.id
  end

  def logout_user()
    session[:user_id] = nil
  end

  def current_user
    if !session[:user_id].nil?
      return User.find(session[:user_id])
    end
  end

  def current_user_name
    if !current_user.nil?
      current_user.name
    end
  end

  def is_logged_in_user?(user)
    if !current_user.nil?
      return current_user.email == user.email
    else
      return false
    end
  end

  def user_row_css_class(user)
    if is_logged_in_user?(user)
      "class='current'"
    else
       "test"
    end
  end

  def signed_in?
    !current_user.nil?
  end
end
