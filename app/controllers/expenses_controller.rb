class ExpensesController < ApplicationController

	def index
		@expenses = Expense.where(status: 'pendente')
		@expenses = @expenses.order :due_date
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
end
