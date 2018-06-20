Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :users, :path => "users" ,controllers: {
      sessions: 'user/users/sessions',
      registrations: 'user/users/registrations',
      passwords: 'user/users/passwords'
    }

    scope module: 'user' do
      resources   :users,       only: [:show] do
        member do
          get   :profile_edit
          patch :profile_update
          get   :helper_edit
          patch :helper_update
        end
          post  :helper_create
      end
      patch '/users/:id/retire', to: 'users#retire'
      patch '/users/retire_completed', to: 'users#retire_completed'

      resources :my_recipes

      get '/recipes/search', to: 'recipes#search'
      get '/recipes/tag_search', to: 'recipes#tagSearch'

      resources :recipes,       only:   [:index, :show] do
       resources :favorites,    only:   [:create]
      end
      resources :favorites,     except: [:update, :edit, :create]


      get '/shopping_lists/send' => "shopping_lists#send_mail"
      resources :shopping_lists,  except: [:index, :new]
      resources :stock_lists,   except: [:index, :edit, :update]
      resources :recently_cooked_recipes, only: [:index, :destroy]
      get '/recently_cooked_recipes/create', to: 'recently_cooked_recipes#create'
    end

    devise_for :administrators, :path => "administrators", controllers:{
      sessions: 'admin/administrators/sessions',
      registrations: 'admin/administrators/registrations',
      passwords: 'admin/administrators/passwords'
    }


    namespace :admin do
      resources :administrators, only: [:show, :edit, :update]
      resources :users, shallow: true do
        get '/retire', to: 'users#retire'
        get '/entitle', to: 'users#entitle'
        resources :favorites, shallow: true
        resources :my_recipes, shallow: true
      end
      resources :recipes
      get '/ingredients/search', to: 'ingredients#search'
      resources :ingredients
      get '/tags/search', to: 'tags#search'
      resources :tags
      get '/', to: 'root#top'
    end

    root to: 'user/root#top'
end
