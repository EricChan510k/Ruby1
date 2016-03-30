BestOfYearAwards::Application.routes.draw do
  
  get "orders/success"
  get "orders/failure"

  namespace :admin do
    # resources :submissions, :only => [:show, :edit, :update]
    # get "home/search_submissions" => "home#search_submissions", :as => :home_search_submissions
  end
  
  resources :submission_step, :path => 'submission/step'
  resources :payment_process, :path => 'submission/payment'

  get "submission/dashboard" => "home#submission_landing", :as => :home_submission_landing

  post 'submission/resume_later' => "home#resume_later", :as => :home_resume_later
  get 'submission/edit/:id' => "home#edit_submission", :as => :home_edit_submission
  
  get 'account/submissions/paid' => "home#previous_submissions", :as => :home_previous_submissions
  get 'account/submissions/pending' => "home#current_submissions", :as => :home_current_submissions
  
  get 'vote' => "home#vote", :as => :home_vote
  get 'event' => "home#event", :as => :home_event
  get 'faq' => "home#faq", :as => :home_faq
  
  get 'signup' => "users#new", :as => :signup
	post 'signup' => "users#create", :as => :signup
  resource :user, :only => [:edit, :update], :path => '/account'
  resources :users, :only => [:new,:create]
  
  get 'login' => "user_sessions#new", :as => :login
	post 'login' => "user_sessions#create", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  resources :user_sessions, :only => [:new, :create, :destroy]

  root :to => 'home#index'

end
