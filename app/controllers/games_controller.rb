class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @q = Game.ransack(params[:q])
    @games = @q.result.includes(:gaming_system)
    @gaming_systems = GamingSystem.order(priority: :desc, name: :asc)
    @age_restrictions = [['any', nil], ['12+', '12+'], ['18+', '18+']]
  end

  def show
    @game = Game.find(params[:id])
    @dm = @game.dm
  end

  def new
    @game = Game.new
    @gaming_systems = GamingSystem.order(priority: :desc, name: :asc)
  end

  def create
    @game = Game.new(game_params.except(:free, :gaming_system))
    @gaming_systems = GamingSystem.order(priority: :desc, name: :asc)
    @game.gaming_system = GamingSystem.find_by(name: params[:game][:gaming_system])
    @game.dm = current_user
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
        flash.now[:danger] = "Error creating game: #{@game.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
    @gaming_systems = GamingSystem.order(priority: :desc, name: :asc)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path, notice: "Game was successfully deleted."
  end

  private

    def game_params
        params.require(:game).permit(:title, :description, :age_restriction, :application_process, 
        :price, :duration, :seats, :experience, :gaming_system, :power_level, :free)
    end
end
