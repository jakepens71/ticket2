class PagesController < ApplicationController

	


	def getAllUsers

		@users = User.order(:id).all

		respond_to do |format|
			format.html
			format.xml { render :xml => @users }
		end

	end

end
