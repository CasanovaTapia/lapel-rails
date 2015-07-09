require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:order)).to be_valid
  end

  it 'is invalid without a status' do
     order = FactoryGirl.build(:order, status: nil)
     expect(order).to be_invalid
  end

  it 'is invalid without a delivery' do
    order = FactoryGirl.build(:order, delivery: nil)
    expect(order).to be_invalid
  end
end
