require 'rails_helper'

RSpec.describe 'Integration', type: :system do
  before(:each) do
    User.create(name: 'Addisu')
    @user.save
    @category = Category.new(
      name: 'delete-icon',
      icon: 'https://fdn2.gsmarena.com/vv/bigpic/apple-iphone-14-pro-max-.jpg',
      user: @user
    )
    @category.save
    sign_in(@user)
  end

  describe 'Categories' do
    it 'show the header' do
      visit '/categories'
      expect(page.body).to include('Categories')
    end
  end
end
