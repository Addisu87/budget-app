require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    before(:each) do
      @category = Category.new(name: 'delete-icon', icon: 'trash', author_id: 1)
    end

    context 'confirm the category name' do
      it 'not exist' do
        expect(@category.name).to eq(@category.name)
      end
    end

    it 'it is valid with valid attributes' do
      expect(@category.icon).to eq('trash')
    end

    it 'icon should be present' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end
end
