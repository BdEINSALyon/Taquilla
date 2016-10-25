class Admin::EventsController < Admin::AdminController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @event = Event.find params[:id]
  end

  def update
    @event = Event.find params[:id]
    if @event.update event_params
      flash[:notice] = 'Evènement mis à jour'
    else
      flash[:alert] = 'Erreur lors de la mise à jour'
    end
    render action: :edit
  end

  # noinspection RailsChecklist01
  def destroy
    @event = Event.find params[:id]
    @event.destroy!
    flash[:notice] = "#{@event.name} a été supprimé"
    redirect_to action: :index
  end

  def show
    @event = Event.find params[:id]
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :location,
                                  :seats, :status, :organization_id,
                                  :start_date, :end_date)
  end
end
