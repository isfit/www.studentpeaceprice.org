WwwStudentpeaceprizeOrg::Application.routes.draw do

  scope "/:locale(/:tab)" do
    get "events/:year/:month/:day" => "events#index", :as => "events"
    get "events/:category/:year/:month/:day" => "events#index", :as => "events_with_date_cat"
    get "events/:category" => "events#index", :as => "events_cat"
    get "event/:id" => "events#show", :as => "event"
    get "event/:id/:event_date_id" => "events#show", :as => "event_date"

    resources :events
    resources :pages

    resources :galleries do
      resources :gallery_albums, :as => :albums do
        resources :gallery_photos, :as => :photos
      end
    end

    resources :articles do
      collection do
        get :index_rest
      end
    end
  end

  root :to => "articles#index", :tab => 'home'
  match '/:locale' => 'articles#index', :tab => 'home'
  # The priority is based upon order of creation: first created -> highest priority.
  match ':tab(/:controller(/:action(:id)))', :id => /.*/
end
