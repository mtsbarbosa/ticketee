class Project < ActiveRecord::Base
	validates :name, presence: { message: I18n.t("project.name") + " " + I18n.t("errors.messages.blank") }
	has_many :tickets, dependent: :delete_all
end