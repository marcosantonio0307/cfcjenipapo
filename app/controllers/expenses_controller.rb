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
end
