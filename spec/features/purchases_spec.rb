require 'rails_helper'

RSpec.describe Purchase, type: :feature do
  before :each do
    @user = User.create(
      name: 'Addisu',
      email: 'addisu@gmail.com',
      password: '123456'
    )

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button('Log in')

    @purchase = Purchase.new(
      name: 'Ball',
      amount: 13.20,
      author_id: @user.id
    )

    visit purchases_path
  end

  it 'show a created purchase' do
    expect(page).to have_content(@purchase.name)
  end
end
