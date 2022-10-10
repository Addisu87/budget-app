require 'rails_helper'

RSpec.describe Category, type: :feature do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.new(name: 'approval-icon', icon: 'nick', user: @user)
  end

  it 'name should be present' do
    expect(@category.name).to eq('approval-icon')
  end

  it 'icon should be present' do
    expect(@category.user).to eq(@user)
  end

  it 'has an icon' do
    expect(@category.icon).to eq('nick')
  end
end
