WwwStudentpeaceprizeOrg::Application.routes.draw do

  scope "/:locale(/:tab)" do
    resources :pages

    resources :articles do
      collection do
        get :index_rest
        get :all
      end
    end
  end

  root :to => "articles#index", :tab => 'home'
  match '/:locale' => 'articles#index', :tab => 'home'
  # The priority is based upon order of creation: first created -> highest priority.
  match ':tab(/:controller(/:action(:id)))', :id => /.*/
end