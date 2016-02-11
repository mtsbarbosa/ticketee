require 'spec_helper'

feature "Profile page" do
	scenario "viewing" do
		user = FactoryGirl.create(:user)

		visit user_path(user)

		expect(page).to have_content(user.name)
		expect(page).to have_content(user.email)
	end
end

feature "Editing Users" do
	scenario "Updating a user profile" do
		user = FactoryGirl.create(:user)

		visit user_path(user)
		click_link I18n.t("users._edit_entity")

		fill_in "user_name", with: "new_username"
		click_button I18n.t("users._update_entity")

		expect(page).to have_content(I18n.t("users._entity_updated_success"))
	end
end