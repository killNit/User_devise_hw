class SportsController < ApplicationController
  def index
    @sports = current_user.sports
    
  end

  def new
    @sport = Sport.new
     render partial: "sport_form"
  end

  def create
  @sport = current_user.sports.new(sport_params)
    if @sport.save
    redirect_to sports_path, notice: "Sport was added to your favorites!"
    else render :new, notice: "Try again moron..."
    end
  end

  def edit
    @sport = current_user.sports.find(params[:id])
    render partial: "sport_form"
  end

  def update
    @sport = current_user.sports.find(params[:id])
    if @sport.update(sport_params)
      redirect_to sports_path
    else
      binding.pry
      render :edit
    end
  end

  def show
    @sport = current_user.sports.find(params[:id])
  end
  
  def destroy
    @sport = current_user.sports.find(params[:id])
    @sport.destroy
    redirect_to root_path
  end

  private

  def sport_params
  params.require(:sport).permit(:name, :favorite_team)
  end
end
