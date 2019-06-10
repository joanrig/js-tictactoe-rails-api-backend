class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  def index 
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(state: game_params)
    #binding.pry
    if @game.save
      respond_to do |format|
         format.html { redirect_to root_path }
         format.json { render json: @game}
       end
    else 
      render :new 
    end
  end

  def show 
    render json: @game
  end

  def update 
    if @game.update(state: game_params)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @game}
      end
    else 
      render :edit    
    end
  end

    private
    def game_params
      #binding.pry
      params.require(:state)
    end

    def set_game
      @game = Game.find_by_id(params[:id])
    end

end
