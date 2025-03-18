class Game
    # atributos
    attr_accessor :players, :current_word, :attempts_left, :correct_guesses, :status, :max_attempts, :word_list
  
    def initialize
      @players = []
      @word_list = ["risoto", "berinjela", "nhoque", "domingos"]
      @status = 'pending'
      @attempts_left = 6
      @correct_guesses = ""
      @max_attempts = 6
    end
  
    # inicia jogo e seleciona palavra aleatória
    def start_game
      @status = 'in_progress'
      @current_word = @word_list.sample
      @correct_guesses = "_" * @current_word.length
    end
  
    # processa uma tentativa de adivinhar uma letra
    def guess_letter(letter)
      return if @status != 'in_progress'
  
      if @current_word.include?(letter)
        update_correct_guess(letter)
      else
        update_incorrect_guess
      end
    end
  
    #jogador venceu ou perdeu?
    def finished?
      @correct_guesses == @current_word || @attempts_left.zero?
    end
  
    # exibe o status do guess bem charlie xcx 
    def game_status
      if @correct_guesses == @current_word
        "Você venceu! A palavra era #{@current_word}."
      elsif @attempts_left.zero?
        "Você perdeu! A palavra era #{@current_word}."
      else
        "Palavra: #{@correct_guesses} | Tentativas restantes: #{@attempts_left}"
      end
    end
  
    private
  
    # atualiza o número de tentativas restantes após um erro
    def update_incorrect_guess
      @attempts_left -= 1
    end
  
    # atualiza os acertos corretos
    def update_correct_guess(letter)
      @current_word.chars.each_with_index do |char, index|
        if char == letter
          @correct_guesses[index] = letter
        end
      end
    end
  end
  