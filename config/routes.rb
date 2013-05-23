Zebra::Application.routes.draw do

  resources :users

  #get "monitor/:id/files" => 'monitor#files'


  #get "users/:id/files" => 'monitor#files'



#  get 'browser' => 'browser#index'
  #get 'browser/:id/index' => 'browser#index'
  get 'browser/:id/foo' => 'browser#foo'

end
