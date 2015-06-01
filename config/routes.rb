Rails.application.routes.draw do


  devise_for :usuarios
  resources :produtos, :all
  resources :lojas, :all
  resources :orcamentos, :only => [ :new, :create, :edit, :update, :destroy, :show]

  namespace :admin do

    resources :albuns do
      resources :album_fotos, :except => [:show]
    end

    resources :categorias, :except => [:show]
    resources :usuarios, :except => [:show]
    resources :lojas, :all
    resources :funcionarios, :all
    resources :fornecedores, :all
    resources :produtos, :all
    resources :orcamentos, :all do
      member do
        get 'acompanhar_orcamento'
        post 'acompanhar_orcamento'
      end
    end
  end


  root 'produtos#index'

  get 'buscar_cidades' => 'cidades#buscar_cidades'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
