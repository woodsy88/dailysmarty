require 'rails_helper'

describe 'user navigation' do
  describe 'creation' do
    it 'can register with full set of user attributes' do
      visit new_user_registration_path

      find('#registration_email').set('test@test.com')
      find('#registration_password').set('password')

      fill_in 'user[password_confirmation]', with: "password"
      fill_in 'user[first_name]', with: "Jon"
      fill_in 'user[last_name]', with: "Snow"
      fill_in 'user[username]', with: "watcheronthewall"

      click_on "Sign up"

      expect(page).to have_content("Welcome")
    end
  end
end