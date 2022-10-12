require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe 'validations' do
    before(:each) do
      @purchase = Purchase.create(name: 'Food', amount: 13.2, author_id: 1)
    end

    context 'confirm the transation name' do
      it 'not exist' do
        expect(@purchase.name).to eq(@purchase.name)
      end
    end

    it 'amount should be present' do
      @purchase.amount = nil
      expect(@purchase).to_not be_valid
    end
  end
end
