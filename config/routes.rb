Rails.application.routes.draw do

	resources :studants, only:[:index, :new, :create, :edit, :update, :destroy, :show]
	root 'home#index'
end
