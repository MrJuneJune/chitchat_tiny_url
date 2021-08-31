Rails.application.routes.draw do
  root 'token_urls#new'
  get '/:token', to: 'token_urls#show', as: 'token_urls_redirects'
  get '/:token/info', to: 'token_urls#index', as: 'token_urls_index'
  # Improvement: Check if I can change resource base url to '/' instead of 'tiny_url' so I can just put everything in resource?
  resources :token_urls, only: [:create]
end
