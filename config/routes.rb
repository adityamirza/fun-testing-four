Rails.application.routes.draw do
  scope '/api', module: 'api' do
    post :authenticate, to: 'authentication#authenticate', as: 'authenticate'
    get :me, to: 'users#me', as: 'users_me'
    resources :features, except: [:create] do
      get :scenarios, on: :member, to: 'features#scenarios'
    end
    resources :squads, except: [:destroy] do
      get :features, on: :member, to: 'squads#features'
      post :features, on: :member, to: 'squads#create_feature'
    end
    resources :users, except: [:destroy]
    resources :steps, only: [:create]
    resources :scenarios, only: [:create, :update]
  end
end
