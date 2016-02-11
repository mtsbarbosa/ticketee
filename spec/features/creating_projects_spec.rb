require 'spec_helper'

feature 'Creating Projects' do
	before do
		visit '/'

		click_link I18n.t("projects._new_entity")
	end

	scenario "can create a project" do
		fill_in "project_name", with: 'TextMate 2'
		fill_in "project_description", with: 'A text-editor for OS X'
		click_button I18n.t("projects._create_entity")

		expect(page).to have_content(I18n.t("projects._create_entity_success"))

		project = Project.where(name: "TextMate 2").first

		expect(page.current_url).to eql(project_url(project))

		title = "TextMate 2 - " + I18n.t("projects._entity_pluralized") +" - Ticketee"
		expect(page).to have_title(title)
	end

	scenario "can not create a project without a name" do
		click_button I18n.t("projects._create_entity")

		expect(page).to have_content(I18n.t("projects._create_entity_fail"))
		expect(page).to have_content(I18n.t("project.name") + " " + I18n.t("errors.messages.blank"))
	end
end