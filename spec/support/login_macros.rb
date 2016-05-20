module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def set_user_cookies(user)
    cookies.signed[:user_id] = user.id
    cookies[:remember_token] = user.remember_token
  end

  def sign_in(user)
    visit root_path
    click_on 'Sign in'
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    click_on 'Log in'
  end

  def is_logged_in?
    !session[:user_id].nil?
  end
end

RSpec.configure do |config|
  config.include LoginMacros
end
