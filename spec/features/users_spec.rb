require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'is valid with a name' do
    expect(@user.name).to eq('Addisu')
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid an invalid email' do
    @user.email = 'a' * 51
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password less than 6 characters' do
    @user.password = 'a' * 5
    expect(@user).to_not be_valid
  end

  it 'is valid with a name, an email, and a password' do
    expect(@user).to be_valid
  end
end
