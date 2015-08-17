class PagesController < ApplicationController

	
	def getTotalTickets
		@totalTickets = Ticket.where('status = ?', 'f').count

		respond_to do |format|
			format.json { render json: {:tickets => @totalTickets } }
		end

	end


	def getAllUsers

		@users = User.order(:id).all

		respond_to do |format|
			format.html
			format.xml { render :xml => @users }
		end

	end

end
