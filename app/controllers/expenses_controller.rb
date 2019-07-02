class ExpensesController < ApplicationController

	def index
		@expenses = Expense.where(status: 'pendente')
		@expenses = @expenses.order :due_date
	end

	def arrears
		@expenses = Expense.where(status: 'pendente')
		today = Time.now
		today = today.strftime("%Y-%m-%d")
		filter = []

		@expenses.each do |expense|
			if expense.due_date.strftime("%Y-%m-%d") < today
				filter << expense
			end
		end

		@expenses = filter
	end

	def new
		@expense = Expense.new
	end

	def create
		values = params.require(:expense).permit!
		@expense = Expense.create values
		@expense.update(status: 'pendente')

		redirect_to expenses_path, notice: 'Conta Salva com Sucesso!'
	end

	def pay
		@expense = Expense.find(params[:id])
		@expense.update(status: 'pago')
		cash = Cash.create(category: 'Despesa', price: @expense.price, description: @expense.description )
		redirect_to expenses_path, notice: 'Pagamento Registrado com Sucesso!'
	end

	def filter_date
		@expenses = Expense.where(status: 'pendente')
		@begin_date = params[:begin_date]
		@end_date = params[:end_date]

		filter = []

		if @begin_date > @end_date
			render :index
		else
			@expenses.each do |expense|
				if expense.due_date.strftime("%Y-%m-%d") == @begin_date
					filter << expense
				elsif expense.due_date.strftime("%Y-%m-%d") > @begin_date && expense.due_date.strftime("%Y-%m-%d") < @end_date
					filter << expense
				elsif expense.due_date.strftime("%Y-%m-%d") == @end_date
					filter << expense
				end
			end
			@expenses = filter
		end
	end
end
