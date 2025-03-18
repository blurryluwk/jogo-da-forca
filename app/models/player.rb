class Player
    # atributos
    attr_accessor :name, :game
  
    def initialize(name)
      @name = name
    end
  
    # iniciar um jogo com um jogador
    def start_game(game)
      @game = game
      game.players << self
    end
  end
  