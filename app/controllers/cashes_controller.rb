class CashesController < ApplicationController

	def index
		@cashes = Cash.all
	end

	def new_in
		@cash = Cash.new
		@cash.category = 'Receita'
		@cash.save
		redirect_to edit_cash_path(@cash)
	end

	def new_out
		@cash = Cash.new
		@cash.category = 'Despesa'
		@cash.save
		redirect_to edit_cash_path(@cash)
	end

	def edit
		@cash = Cash.find(params[:id])
	end

	def update
		@cash = Cash.find(params[:id])
		values = params.require(:cash).permit!
		@cash.update values
		redirect_to cashes_path
	end
end
