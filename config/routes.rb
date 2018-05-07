Rails.application.routes.draw do
  scope module: 'api' do
    post :authenticate, to: 'authentication#authenticate', as: 'authenticate'
  end
end
