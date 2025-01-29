class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :assign_users]

  def index
    # Dzielimy wydarzenia na filmy i koncerty
    @movies = Event.where(event_type: 'Film')
    @concerts = Event.where(event_type: 'Koncert')
  end

  def show
    # event już ustawiony przez set_event
  end

  def new
    @event = Event.new
    @users = User.all
  end

  def create
    @event = Event.new(event_params)

    # Sprawdzamy, czy wydarzenie jest typu Film lub Koncert
    if @event.event_type == 'Film' && @event.movie_id.blank?
      @event.errors.add(:movie_id, "Film musi być wybrany dla wydarzenia typu Film")
      render :new and return
    end

    if @event.event_type == 'Koncert' && @event.performer_ids.blank?
      @event.errors.add(:performer_ids, "Wykonawcy muszą być przypisani dla wydarzenia typu Koncert")
      render :new and return
    end

    if @event.save
      redirect_to events_path, notice: 'Wydarzenie zostało dodane.'
    else
      render :new
    end
  end

  def edit
    @users = User.all
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Wydarzenie zostało zaktualizowane.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Wydarzenie zostało usunięte.'
  end


  def assign_users
    # Jeśli metoda PATCH, przypisujemy użytkowników do wydarzenia
    if request.patch? && params[:event]
      @event.user_ids = params[:event][:user_ids]
      if @event.save
        redirect_to @event, notice: 'Użytkownicy zostali przypisani do wydarzenia.'
      else
        render :assign_users
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    # Dopuszczamy różne parametry w zależności od typu wydarzenia
    params.require(:event).permit(:name, :date, :event_type, :movie_id, performer_ids: [], user_ids: [])
  end
end
