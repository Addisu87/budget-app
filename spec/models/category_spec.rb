require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.new(name: 'delete-icon', icon: 'trash', user: @user)
  end

  it 'it is valid with valid attributes' do
    expect(@category.valid?).to eq(true)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'icon should be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end
