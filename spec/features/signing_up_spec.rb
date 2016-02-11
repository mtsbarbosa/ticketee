require 'spec_helper'

feature 'Signing up' do
	scenario 'Successful sign up' do
		visit '/'

		click_link I18n.t("users._sign_up")
		fill_in 'user_email', with: "user@example.com"
		fill_in 'user_password', with: "password"
		fill_in 'user_password_confirmation', with: "password"
		click_button I18n.t("users._sign_up")

		expect(page).to have_content(I18n.t("users._sign_up_success"))
	end
end