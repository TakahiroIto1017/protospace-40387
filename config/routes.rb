Rails.application.routes.draw do
  devise_for :users
# Prefix                   Verb   URI Pattern                    Controller#Action
# new_user_session         GET    /users/sign_in(.:format)       devise/sessions#new
# user_session             POST   /users/sign_in(.:format)       devise/sessions#create
# destroy_user_session     DELETE /users/sign_out(.:format)      devise/sessions#destroy
# new_user_password        GET    /users/password/new(.:format)  devise/passwords#new
# edit_user_password       GET    /users/password/edit(.:format) devise/passwords#edit
# user_password            PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
# new_user_registration    GET    /users/sign_up(.:format)       devise/registrations#new
# edit_user_registration   GET    /users/edit(.:format)          devise/registrations#edit
# user_registration        PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create

  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: [:create]
  end
# Prefix                   Verb   URI Pattern                    Controller#Action
# root                     GET    /                              prototypes#index
# prototypes               GET    /prototypes(.:format)          prototypes#index
#                          POST   /prototypes(.:format)          prototypes#create
# new_prototype            GET    /prototypes/new(.:format)      prototypes#new
# edit_prototype           GET    /prototypes/:id/edit(.:format) prototypes#edit
# prototype                GET    /prototypes/:id(.:format)      prototypes#show
#                          PATCH  /prototypes/:id(.:format)      prototypes#update
#                          PUT    /prototypes/:id(.:format)      prototypes#update
#                          DELETE /prototypes/:id(.:format)      prototypes#destroy

# Prefix             Verb   URI Pattern                                  Controller#Action
# prototype_comments POST   /prototypes/:prototype_id/comments(.:format) comments#create

  resources :users, only: :show
# Prefix  Verb  URI Pattern          Controller#Action
# user    GET   /users/:id(.:format) users#show

end
