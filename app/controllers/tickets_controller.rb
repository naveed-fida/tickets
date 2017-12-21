class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @projects = Project.all
  end

  def edit
    @ticket = Ticket.find(params[:id])
    @projects = Project.all
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:notice] = "The ticket was saved!"
      redirect_to tickets_path
    else
      render 'new'
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:notice] = "The ticket was updated!"
      redirect_to tickets_path
    else
      render 'edit'
    end
  end

  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy!
    flash[:notice] = 'Ticket has been deleted'
    redirect_to tickets_path
  end

  private
  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id)
  end
end
