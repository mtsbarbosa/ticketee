class Ticket < ActiveRecord::Base
  validates :title, presence: { message: I18n.t("ticket.title") + " " + I18n.t("errors.messages.blank") }
  validates :description, presence: { message: I18n.t("ticket.description") + " " + I18n.t("errors.messages.blank") },
  							length: { minimum: 10 }
  belongs_to :project
  belongs_to :user
end
