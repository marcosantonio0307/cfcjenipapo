Rails.application.routes.draw do

	get 'procedures/:id/select_studant' => 'procedures#select_studant', as: :select_studant_procedure
	get 'procedures/:id/selection' => 'procedures#selection', as: :selection_procedure
	get 'procedures/:id/payment' => 'procedures#payment', as: :payment_procedure
	get 'procedures/:id/class' => 'procedures#class', as: :procedure_class
	get 'procedures/:id/new_class' => 'procedures#new_class', as: :new_class_procedure

	resources :studants, only:[:index, :new, :create, :edit, :update, :destroy, :show]
	resources :procedures do
		resources :portions
	end

	root 'home#index'
end
