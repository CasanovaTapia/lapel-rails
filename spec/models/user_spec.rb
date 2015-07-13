require 'rails_helper'

RSpec.describe User, type: :model do

   it 'responds to a name' do
      user = FactoryGirl.build(:user)
      expect(user).to respond_to(:name)
   end

   it 'responds to an email' do
      user = FactoryGirl.build(:user)
      expect(user).to respond_to(:email) && be_valid
   end

   it 'is invalid without a password' do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to be_invalid
   end

   it 'is invalid without a name' do
      user = FactoryGirl.build(:user, name: nil)
      expect(user).to be_invalid
   end

   it 'is invalid with a short password' do
      user = FactoryGirl.build(:user, password: "123")
      expect(user).to be_invalid
   end

   it 'is invalid with unformatted email' do
      user = FactoryGirl.build(:user, email: 'false')
      expect(user).to be_invalid
   end

   it "responds to client_orders" do
     liaison = FactoryGirl.create(:user, role: 'liaison')
     expect(liaison).to respond_to(:client_orders)
   end

   it "responds to client_appointments" do
     liaison = FactoryGirl.create(:user, role: 'liaison')
     expect(liaison).to respond_to(:client_appointments)
   end

   it "returns a user-client's liaisons" do
     client = FactoryGirl.create(:user, role: 'client')
     expect(client).to respond_to(:liaisons)
   end
end
