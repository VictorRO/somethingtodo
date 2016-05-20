require 'rails_helper'

RSpec.describe User, 'validations' do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  context 'with valid email address' do
    it 'is valid' do
      valid_addresses = %w[user@example.com NAME@someOther.COM John_DO-ER@foo.bar.org
                         first.last@foo.jp jane+doe@meh.io]
      user = build(:user)
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  context 'with invalid email address' do
    it 'is invalid' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      user = build(:user)
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end
end

RSpec.describe User, '#remember' do
  it 'updates the remember_digest attribute' do
    user = create(:user, remember_digest: nil)

    user.remember
    user.reload

    expect(user.remember_digest).not_to be_nil
  end
end

RSpec.describe User, '#forget' do
  it 'removes the remember_digest attribute from database' do
    user = create(:user, remember_digest: 'some token')

    user.forget
    user.reload

    expect(user.remember_digest).to be_nil
  end
end

RSpec.describe User, '#authenticated?' do
  context 'when the remember_digest is nil' do
    it 'returns false' do
      user = create(:user, remember_digest: nil)

      expect(user.authenticated?('')).to be false
    end
  end

  context 'when the remember_digest is set' do
    it 'returns true if the remember_distest is equal to the remember_token' do
      remember_token = User.new_token
      user = create(:user, remember_digest: User.digest(remember_token))

      expect(user.authenticated?(remember_token)).to be true
    end
  end
end
