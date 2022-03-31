Rails.application.routes.draw do
  resources :sales
  resources :discounts
  resources :products
  resources :clients
  devise_for :users

  root 'home#index'

  ### Routes theme/layout
  get 'docs/docs_buildnotes'
  get 'intel/intel_introduction'
  get 'intel/intel_marketing_dashboard'
  get 'page/page_inbox_general'
  get 'page/page_search'
  get 'utilities/utilities_responsive_grid'
end
