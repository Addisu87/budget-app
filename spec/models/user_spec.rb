require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'user should be valid' do
    expect(@user).to be_valid
  end

  it 'validates the user name match' do
    expect(@user.name).to eql('Addisu')
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'email should be present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'validates the user email match' do
    expect(@user.email).to eql('addisu@gmail.com')
  end

  it 'password should be present' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'validates the user password match' do
    expect(@user.password).to eql('123456')
  end
end
