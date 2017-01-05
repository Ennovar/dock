Rails.application.routes.draw do
  root 'websites#index'
  put '/websites/:id/stop' => 'websites#run', as: 'run_website'
  put '/websites/:id/start' => 'websites#stop', as: 'stop_website'
  resources :websites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
