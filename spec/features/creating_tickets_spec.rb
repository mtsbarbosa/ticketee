require 'spec_helper'

feature "Creating Tickets" do
	let!(:user) {FactoryGirl.create(:user)}
	let!(:project) {FactoryGirl.create(:project)}

	before do
		visit '/'
		click_link project.name
		click_link I18n.t("tickets._new_entity")
		message = I18n.t("sessions._need_sign_before")
		expect(page).to have_content(message)

		fill_in "signin_name", with: user.name
		fill_in "signin_password", with: user.password
		click_button I18n.t("sessions._sign_in")

		click_link project.name
		click_link I18n.t("tickets._new_entity")
	end

	scenario "Creating a ticket" do
		fill_in "ticket_title", with: "Non-standards compliance"
		fill_in "ticket_description", with: "My pages are ugly!"
		click_button I18n.t("tickets._create_entity")

		expect(page).to have_content(I18n.t("tickets._create_entity_success"))
		within "#ticket #author" do
			expect(page).to have_content(I18n.t("tickets._created_by") + " #{user.email}")
		end
	end

	scenario "Creating a ticket without valid attributes fails" do
		click_button I18n.t("tickets._create_entity")

		expect(page).to have_content(I18n.t("tickets._create_entity_fail"))
		expect(page).to have_content(I18n.t("ticket.title") + " " + I18n.t("errors.messages.blank"))
		expect(page).to have_content(I18n.t("ticket.description") + " " + I18n.t("errors.messages.blank"))
	end

	scenario "Description must be longer than 10 characters" do
		fill_in "ticket_title", with: "Non-standards compliance"
		fill_in "ticket_description", with: "it sucks"
		click_button I18n.t("tickets._create_entity")

		expect(page).to have_content(I18n.t("tickets._create_entity_fail"))
		##expect(page).to have_content("Description is too short")
	end
end