module AuthenticationHelpers
	def sign_in_as!(user)
		visit '/signin'
		fill_in "Name", with: user.name
		fill_in "Password", with: user.password
		click_button I18n.t("users._sign_in")
		expect(page).to have_content(I18n.t("users._sign_in_success"))
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end