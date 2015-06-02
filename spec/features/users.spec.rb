require 'rails_helper'

feature 'User signs in' do
	scenario 'with valid credentials' do
		visit new_user_registration_path
		fill_in 'Name', with: 'John Smith'
		fill_in 'Email', with: 'johnsmith@gmail.com'
		fill_in 'Password', with: 'password'
		click_on 'Sign up'

		expect(page).to have_content('Welcome! You have signed up successfully.')
	end
end