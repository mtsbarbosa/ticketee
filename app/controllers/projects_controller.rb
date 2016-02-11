class ProjectsController < ApplicationController
	before_action :set_project, only: [:show,
									   :edit,
									   :update,
									   :destroy]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = I18n.t("projects._create_entity_success")
			redirect_to @project
		else
			# nothing, yet
			flash[:alert] = I18n.t("projects._create_entity_fail")

			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @project.update(project_params)
			flash[:notice] = I18n.t("projects._update_entity_success")
			redirect_to @project
		else
			flash[:alert] = I18n.t("projects._update_entity_fail")
			render "edit"
		end
	end

	def destroy
		@project.destroy

		flash[:notice] = I18n.t("projects._delete_entity_success")

		redirect_to projects_path
	end

	private

		def project_params
			params.require(:project).permit(:name, :description)
		end

	private
		def set_project
			@project = Project.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = I18n.t("projects._entity_looking_not_found")
			redirect_to projects_path
		end
end
