class GamesController < ApplicationController
    before_action :set_game, only: [:show, :guess]
  
    def index
      @game = Game.new
    end
  
    def create
      @game = Game.new
      @game.start_game
      redirect_to game_path(@game)
    end
  
    def show
      # O jogo já está carregado pelo before_action
    end
  
    def guess
      letter = params[:letra]
      @game.guess_letter(letter)
      if @game.finished?
        redirect_to victory_or_loss_game_path(@game)
      else
        render :show
      end
    end
  
    def victory_or_loss
      @game = Game.find(params[:id])
    end
  
    private
  
    def set_game
      @game = Game.find(params[:id])
    end
  end
  