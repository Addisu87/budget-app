require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before(:each) do
    @user = User.new(name: 'Addisu', email: 'addisu@gmail.com', password: '123456', password_confirmation: '123456')
    @purchase = Purchase.new(name: 'Test Food', amount: 13.2, user: @user)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'amount should be present' do
    @purchase.amount = nil
    expect(@purchase).to_not be_valid
  end

  it 'amount should be equal to or greater that zero' do
    @purchase.amount = 4.5
    expect(@purchase).to be_valid
  end
end
