Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'bachelorettes/:bachelorette_id', to: "bachelorettes#show"
  get 'bachelorettes/:bachelorette_id/contestants', to: "bachelorettes#index"

end
