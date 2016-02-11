require 'spec_helper'

feature "signing in" do
	scenario 'Signing in via form' do
		user = FactoryGirl.create(:user)

		visit '/'
		click_link I18n.t("users._sign_in")
		fill_in 'signin_name', with: user.name
		fill_in 'signin_password', with: user.password
		click_button I18n.t("users._sign_in")

		expect(page).to have_content(I18n.t("users._sign_in_success"))
	end
end