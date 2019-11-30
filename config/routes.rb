Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments do
  	collection do
  		get 'letter_pad'
  	end
  end
end
