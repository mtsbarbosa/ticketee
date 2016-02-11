require 'spec_helper'

feature "Editing tickets" do
	let!(:project) {FactoryGirl.create(:project)}
	let!(:user) {FactoryGirl.create(:user)}
	let!(:ticket) {FactoryGirl.create(:ticket, project: project, user: user)}

	before do
		sign_in_as!(user)

		visit '/'
		click_link project.name
		click_link ticket.title
		click_link I18n.t("tickets._edit_entity")
	end

	scenario "Updating a ticket" do
		fill_in "ticket_title", with: "Make it really shiny!"
		click_button I18n.t("tickets._update_entity")

		expect(page).to have_content(I18n.t("tickets._update_entity_success"))

		within("#ticket h2") do
			expect(page).to have_content("Make it really shiny!")
		end

		expect(page).to_not have_content ticket.title
	end

	scenario "Updating a ticket with invalid information" do
		fill_in "ticket_title", with: ""
		click_button I18n.t("tickets._update_entity")

		expect(page).to have_content(I18n.t("tickets._update_entity_fail"))
	end
end