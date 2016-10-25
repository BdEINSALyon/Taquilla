class Admin::PassesController < Admin::AdminController

  before_action do
    @event = Event.find params[:event_id]
  end

  def index
    @passes = @event.passes
  end

  def new
    @pass = @event.passes.new
  end

  def create
    @pass = @event.passes.new pass_params
    if @pass.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @pass = @event.passes.find params[:id]
  end

  def update
    @pass = @event.passes.find params[:id]
    if @pass.update pass_params
      flash[:notice] = 'Passe mis à jour'
    else
      flash[:alert] = 'Erreur lors de la mise à jour'
    end
    render action: :edit
  end

  def destroy
    @pass = @event.passes.find params[:id]
    @pass.destroy!
    flash[:notice] = "Le passe a été supprimé"
    redirect_to action: :index
  end

  def show
    redirect_to action: :index
  end

  private

  def pass_params
    params.require(:pass).permit(:name, :description, :price,
                                  :seats, :status, :organization_id,
                                  :pass_start, :pass_end)
  end
end
