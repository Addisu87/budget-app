require 'rails_helper'

RSpec.describe Purchase, type: :feature do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @purchase = Purchase.new(name: 'Ball', amount: 13.2, user: @user)
    @user.save
  end

  it 'belongs to a user' do
    expect(@purchase.user).to eq(@user)
  end

  it 'has a name' do
    expect(@purchase.name).to eq('Ball')
  end

  it 'destroys the purchase when the category is destroyed' do
    @purchase.destroy
    expect(@purchase.destroyed?).to eq(true)
  end
end
