Polcomp::Application.routes.draw do

  resources :proprietaries


  get "mainforms/showsessions" => "mainforms#showsessions", :as => "showsessions"  
  get "mainforms/showusers" => "mainforms#showusers", :as => "showusers"
  
  get "mainforms/showsessions" => "mainforms#showsessions", :as => "showsessions"
  get "mainforms/code401" => "mainforms#code401"
  get "mainform/new" => "mainform#new", :as => "mainform_new"
  get "mainform/show" => "mainform#show", :as => "show"
  get "mainforms/mainpage" => "mainforms#mainpage", :as => "mainpage"

  get "forms/search" => "forms#search", :as => "search"
  get "forms/searchForms" => "forms#searchForms"
  get 'forms/getFormDetails' => 'forms#getFormDetails', :as => "getFormDetails"
  get 'forms/checkoutForm' => 'forms#checkoutForm'
  get 'forms/copyForm' => 'forms#copyForm'
  get 'forms/excelDownload' => 'forms#excelDownload'
  get 'forms/generateReport' => 'forms#generateReport', :as => "generateReport"
  get 'forms/createForm' => 'forms#createForm', :as => :createForm
  post 'forms/updateForm' => 'forms#updateForm', :as => :updateForm
  post 'forms/unlockedForm' => 'forms#unlockedForm', :as => :unlockedForm
  get 'forms/:id/copy' => 'forms#copy'
  
  get 'sessions/new'
  get 'sessions/errorLogin' => 'sessions#errorLogin', :as => "errorLogin"
  post 'sessions/endSession' => "sessions#endSession"
  post 'sessions/destroy' => "sessions#destroy"

  get "users/new" => "users#new", :as => "adduser"
  
  get "homepage/index"  
  get "homepage/login"

  get "statuses/statusLists" => "statuses#statusLists"
  get 'statuses/getTrackingStatus' => 'statuses#getTrackingStatus'
  get 'statuses/createStatus' => 'statuses#createStatus'
  post 'statuses/updateTrackingStatus' => 'statuses#updateTrackingStatus'
  
  get "policy_types/policyTypeLists" => "policy_types#policyTypeLists" 
  get "policy_types/createPolicyType" => "policy_types#createPolicyType"
  get "policy_types/getPolicyType" => "policy_types#getPolicyType"
  post "policy_types/updatePolicyType" => "policy_types#updatePolicyType"  
  
  get "document_types/documentTypeLists" => "document_types#documentTypeLists" 
  get "document_types/createDocumentType" => "document_types#createDocumentType"
  get "document_types/getDocumentType" => "document_types#getDocumentType"
  post "document_types/updateDocumentType" => "document_types#updateDocumentType"
  
  get "submission_types/submissionTypeLists" => "submission_types#submissionTypeLists" 
  get "submission_types/createSubmissionType" => "submission_types#createSubmissionType"
  get "submission_types/getSubmissionType" => "submission_types#getSubmissionType"
  post "submission_types/updateSubmissionType" => "submission_types#updateSubmissionType"
  
  get "homepage/index"
  get "sessions/new"
  get "mainforms/showusers" => "mainforms#showusers", :as => "manageusers"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "homepage/index" => "homepage#index", :as => "home_page"  

  resources :users
  resources :sessions
  resources :mainforms
  resources :forms
	resources :locked_forms
  resources :document_types
  resources :policy_types
  resources :statuses
  resources :submission_types
  
  root :to => "homepage#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
