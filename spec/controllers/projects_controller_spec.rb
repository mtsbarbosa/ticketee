require 'spec_helper'

describe ProjectsController do
	it "displays an error for a missing project" do
		get :show, id: "not-here"
		expect(response).to redirect_to(projects_path)
		message = I18n.t("projects._entity_looking_not_found")
		expect(flash[:alert]).to eql(message)
	end
end