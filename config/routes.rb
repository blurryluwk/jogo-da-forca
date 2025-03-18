Rails.application.routes.draw do
  root 'games#index'  # Define a página inicial para 'index' no controlador Games
  resources :games    # Cria todas as rotas RESTful para o controlador Games
end
  