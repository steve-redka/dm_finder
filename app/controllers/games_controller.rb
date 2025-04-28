class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
  def index
    @games = Game.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
