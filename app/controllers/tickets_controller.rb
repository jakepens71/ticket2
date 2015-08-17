class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
   if current_user.admin?
	@user = current_user.id
	@tickets = Ticket.where("status = ? and (user_id = ? or user_id is ?)", "false", @user, nil).all
   end

   if !current_user.admin?
	    @user = current_user.id
	    @tickets = Ticket.where("status = ? and created_id = ?", "false", @user).all
   end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
	
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
   #gets the current user id from who the ticket belongs to
    @user = current_user.id
   #Gets the tickt info from the params and parses the desired information
    @ticketInfo = ticket_params
    @title = @ticketInfo["title"]
    @body = @ticketInfo["body"]
    @level = @ticketInfo["level"]
    @assigned_to = @ticketInfo["assigned_to"]
   #Attempts to create new ticket
    @ticket = Ticket.new(:title => @title.to_s, :body => @body.to_s, :level => @level, :user_id => @assigned_to, :created_id => @user)
    

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def getAdmins

	@admins = User.where("admin = ?", "true").all.pluck(:name, :id).join(', ')

	puts @admins

	respond_to do |format|
		format.json { render json: { 'admins': @admins } }
	end	
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:title, :body, :level, :user_id, :assigned_to, :status, :created_id)
    end
end
