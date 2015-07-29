require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(username: "Alex", password: "password")
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is invalid without an password' do
    user.password = nil
    expect(user).not_to be_valid
  end

end