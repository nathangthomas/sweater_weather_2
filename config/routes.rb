Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :places do
        get '/:city', to: 'locations#index'
      end
    end
  end
end
