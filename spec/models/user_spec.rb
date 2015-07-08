require 'rails_helper'

RSpec.describe User, type: :model do

   it 'responds to a name' do
      user = FactoryGirl.build(:perfect_user)
      expect(user).to respond_to(:name)
   end

   it 'responds to an email' do
      user = FactoryGirl.build(:perfect_user)
      expect(user).to respond_to(:email) && be_valid

   end
   it 'is invalid without a password' do
      user = FactoryGirl.build(:user_without_pass)
      expect(user).to be_invalid
   end

   it 'is invalid without a name' do
      user = FactoryGirl.build(:user_wo_name)
      expect(user).to be_invalid
   end

   it 'is invalid with a short password' do
      user = FactoryGirl.build(:user_short_pass)
      expect(user).to be_invalid
   end

   it 'is invalid with unformatted email' do
      user = FactoryGirl.build(:user_wrong_email)
      expect(user).to be_invalid
   end

end
