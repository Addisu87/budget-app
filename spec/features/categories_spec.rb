require 'rails_helper'

RSpec.describe 'categories integrations', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Addisu',
      email: 'addisu@gmail.com',
      password: '123456'
    )

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button('Log in')

    @category = Category.new(
      name: 'Transportation',
      icon: 'plane',
      author_id: @user.id
    )

    visit categories_path
  end

  it 'show a created category' do
    expect(page).to have_content(@category.name)
  end
end
