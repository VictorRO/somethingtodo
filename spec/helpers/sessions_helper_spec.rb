require 'rails_helper'

RSpec.describe SessionsHelper, '#log_in' do
  it 'saves the user id in session' do
    user = create(:user)

    helper.log_in(user)

    expect(session[:user_id]).to eq user.id
  end
end

RSpec.describe SessionsHelper, '#log_out' do
  it 'removes the user from session' do
    user = create(:user)
    set_user_session(user)

    helper.log_out

    expect(session[:user_id]).to be_nil
  end
end

RSpec.describe SessionsHelper, '#remember' do
  it 'saves a remember token in database and in cookies' do
    user = create(:user)

    helper.remember(user)
    user.reload

    expect(user.remember_digest).not_to be_nil
    expect(cookies[:user_id]).not_to be_nil
    expect(cookies[:remember_token]).not_to be_nil
  end
end

RSpec.describe SessionsHelper, '#forget' do
  it 'removes the remember token from database and from cookies' do
    user = create(:user, remember_digest: User.digest('sometoken'))

    helper.forget(user)
    user.reload

    expect(user.remember_digest).to be_nil
    expect(cookies[:user_id]).to be_nil
    expect(cookies[:remember_token]).to be_nil
  end
end

RSpec.describe SessionsHelper, '#current_user' do
  context 'when the user id is stored in session' do
    it 'returns the current user' do
      user = create(:user)
      set_user_session(user)

      expect(helper.current_user).to eq user
    end
  end

  context 'when the user id is stored in cookies (is remembered)' do
    it 'returns the current user' do
      token = User.new_token
      user = create(:user, remember_token: token, remember_digest: User.digest(token))
      set_user_cookies(user)

      expect(helper.current_user).to eq user
    end
  end

  context 'when there is no user loged in' do
    it 'is nil' do
      expect(helper.current_user).to be_nil
    end
  end
end
