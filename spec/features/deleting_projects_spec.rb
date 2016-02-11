require 'spec_helper'

feature "Deleting projects" do
	scenario "Deleting a project" do
		FactoryGirl.create(:project, name: "TextMate 2")

		visit "/"
		click_link "TextMate 2"
		click_link I18n.t("projects._delete_entity")

		expect(page).to have_content(I18n.t("projects._delete_entity_success"))

		visit "/"

		expect(page).to have_no_content("TextMate 2")
	end
end