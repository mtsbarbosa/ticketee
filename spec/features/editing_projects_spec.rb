require 'spec_helper'
feature "Editing Projects" do
	before do
		FactoryGirl.create(:project, name: "TextMate 2")

		visit "/"
		click_link "TextMate 2"
		click_link I18n.t("projects._edit_entity")
	end

	scenario "Updating a project" do
		fill_in "project_name", with: "TextMate 2 beta"
		click_button I18n.t("projects._update_entity")

		expect(page).to have_content(I18n.t("projects._update_entity_success"))
	end

	scenario "Updating a project with invalid attributes is bad" do
		fill_in "project_name", with: ""
		click_button I18n.t("projects._update_entity")

		expect(page).to have_content(I18n.t("projects._update_entity_fail"))
	end
end