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
