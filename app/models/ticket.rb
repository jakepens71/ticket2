class Ticket < ActiveRecord::Base

	self.table_name = "tickets"

	belongs_to :user

end
