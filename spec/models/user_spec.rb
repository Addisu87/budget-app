require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.create(
        name: 'Addisu',
        email: 'addisu@gmail.com',
        password: '123456'
      )
    end

    context 'confirm the user name' do
      it 'not exist' do
        expect(@user.name).to eq(@user.name)
      end
    end
  end
end
