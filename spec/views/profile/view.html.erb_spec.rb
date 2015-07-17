require 'rails_helper'

RSpec.describe "profile/view.html.erb", type: :view do
   scenario "with correct details", js: true do

       create(:user, email: "someone@example.tld", password: "somepassword")

       visit "/"

       click_link "LOG IN"
       expect(page).to have_css("h2", text: "LOGIN")
       expect(current_path).to eq(new_user_session_path)

       login "someone@example.tld", "somepassword"

       expect(current_path).to eq "profile/view"
      #  expect(page).to have_content ""
      #  expect(page).to have_content "Hello, someone@example.tld"

      #  click_button "Log out"
       #
      #  expect(current_path).to eq "/"
      #  expect(page).to have_content "Signed out successfully"
      #  expect(page).not_to have_content "someone@example.tld"

     endend
