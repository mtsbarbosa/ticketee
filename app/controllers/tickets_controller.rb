class TicketsController < ApplicationController
	before_action :require_signin!, except: [:show, :index]
	before_action :set_project
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		@ticket.user = current_user
		if(@ticket.save)
			flash[:notice] = I18n.t("tickets._create_entity_success")
			redirect_to [@project, @ticket]
		else
			flash[:alert] = I18n.t("tickets._create_entity_fail")
			render "new"
		end
	end

	def edit
	end

	def update
		if(@ticket.update(ticket_params))
			flash[:notice] = I18n.t("tickets._update_entity_success")
			redirect_to [@project, @ticket]
		else
			flash[:alert] = I18n.t("tickets._update_entity_fail")
			render action: "edit"
		end
	end

	def destroy
		@ticket.destroy
		flash[:notice] = I18n.t("tickets._delete_entity_success")

		redirect_to @project
	end

	private
		def ticket_params
			params.require(:ticket).permit(:title, :description)
		end

	private
		def set_project
			@project = Project.find(params[:project_id])
		end
		def set_ticket
			@ticket = @project.tickets.find(params[:id])
		end
end
