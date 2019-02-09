Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :crawler, only: :create
    end
  end
end
