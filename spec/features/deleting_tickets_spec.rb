require 'spec_helper'

feature 'Deleting tickets' do
	let!(:project){FactoryGirl.create(:project)}
	let!(:user){FactoryGirl.create(:user)}
	let!(:ticket){FactoryGirl.create(:ticket, project: project, user: user)}

	before do
		sign_in_as!(user)
		
		visit '/'
		click_link project.name
		click_link ticket.title
	end

	scenario "Deleting a ticket" do
		click_link I18n.t("tickets._delete_entity")

		expect(page).to have_content(I18n.t("tickets._delete_entity_success"))
		expect(page.current_url).to eq(project_url(project))
	end
end