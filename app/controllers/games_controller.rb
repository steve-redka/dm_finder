class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params.except(:free))
    @game.dm = current_user
    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
        flash.now[:danger] = "Error creating game: #{@game.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
  end

  private

    def game_params
        params.require(:game).permit(:title, :description, :age_restriction, :application_process, 
        :price, :duration, :seats, :experience, :system, :power_level, :free)
    end
end
