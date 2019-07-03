Rails.application.routes.draw do

 	devise_for :users
	get 'procedures/:id/select_studant' => 'procedures#select_studant', as: :select_studant_procedure
	get 'procedures/:id/selection' => 'procedures#selection', as: :selection_procedure
	get 'procedures/:id/payment' => 'procedures#payment', as: :payment_procedure
	get 'procedures/:id/registred_class' => 'procedures#registred_class', as: :procedure_class
	get 'procedures/:id/new_class' => 'procedures#new_class', as: :new_class_procedure
	get 'procedures/:id/finish' => 'procedures#finish', as: :finish_procedure
	get 'procedures/search' => 'procedures#search', as: :search_procedures
	get	'procedures/opens' => 'procedures#opens'
	get	'procedures/closeds' => 'procedures#closeds'

	get	'portions/pending' => 'portions#pending'
	get	'portions/:id/pay' => 'portions#pay', as: :pay_portion
	get 'portions/filter_date' => 'portions#filter_date'
	get 'portions/arrears' => 'portions#arrears'

	get 'studants/search' => 'studants#search', as: :search_studants

	get	'schedules/select' => 'schedules#select'
	get 'schedules/:id/new' => 'schedules#new', as: :new_schedule
	get 'schedules/:id/registred_class' => 'schedules#registred_class', as: :schedule_class
	get 'schedules/day' => 'schedules#day'
	get 'schedules/filter_date' => 'schedules#filter_date'

	get 'cashes/new_in' => 'cashes#new_in'
	get 'cashes/new_out' => 'cashes#new_out'
	get 'cashes/cash_in' => 'cashes#cash_in'
	get	'cashes/cash_out' => 'cashes#cash_out'
	get	'cashes/cash_day' => 'cashes#cash_day'
	get	'cashes/filter_date' => 'cashes#filter_date'

	get 'expenses/:id/pay' => 'expenses#pay', as: :pay_expense
	get 'expenses/filter_date' => 'expenses#filter_date'
	get	'expenses/arrears' => 'expenses#arrears'

	resources :studants, only:[:index, :new, :create, :edit, :update, :destroy, :show]
	resources :schedules, only:[:index, :edit, :update, :destroy, :show]
	resources :expenses, only:[:index, :new, :create, :destroy, :show]
	resources :cashes, only:[:index, :new, :edit, :update, :destroy, :show]
	resources :procedures do
		resources :portions
	end

	root 'home#index'
end
