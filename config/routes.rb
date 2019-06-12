Rails.application.routes.draw do

	get 'procedures/:id/select_studant' => 'procedures#select_studant', as: :select_studant_procedure
	get 'procedures/:id/selection' => 'procedures#selection', as: :selection_procedure
	get 'procedures/:id/payment' => 'procedures#payment', as: :payment_procedure
	get 'procedures/:id/registred_class' => 'procedures#registred_class', as: :procedure_class
	get 'procedures/:id/new_class' => 'procedures#new_class', as: :new_class_procedure
	get 'procedures/:id/finish' => 'procedures#finish', as: :finish_procedure
	get 'procedures/search' => 'procedures#search', as: :search_procedures
	get	'procedures/opens' => 'procedures#opens'
	get	'procedures/closeds' => 'procedures#closeds'

	get 'studants/search' => 'studants#search', as: :search_studants

	resources :studants, only:[:index, :new, :create, :edit, :update, :destroy, :show]
	resources :procedures do
		resources :portions
	end

	root 'home#index'
end
