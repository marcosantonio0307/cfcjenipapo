class CashesController < ApplicationController

	def index
		@cashes = Cash.all
	end

	def cash_in
		@cashes = Cash.where(category: 'Receita')
		@category = 'Receita'
	end

	def cash_out
		@cashes = Cash.where(category: 'Despesa')
		@category = 'Despesa'
	end

	def cash_day
		@cashes_in = Cash.where(category: "Receita")
		@cashes_in = filter_day(@cashes_in)
		@cashes_out = Cash.where(category: "Despesa")
		@cashes_out = filter_day(@cashes_out)
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

	def filter_date
		@cashes = Cash.where(category: params[:category])
		@begin_date = params[:begin_date]
		@end_date = params[:end_date]

		filter = []

		if @begin_date <= @end_date
			@cashes.each do |cash|
				if cash.created_at.strftime("%Y-%m-%d") == @begin_date
					filter << cash
				elsif cash.created_at.strftime("%Y-%m-%d") > @begin_date && cash.created_at.strftime("%Y-%m-%d") < @end_date
					filter << cash
				elsif cash.created_at.strftime("%Y-%m-%d") == @end_date
					filter << cash
				end
			end
			@cashes = filter
		end
	end

	private

	def filter_day(base)
		today = Time.zone.now
		today = today.strftime("%Y-%m-%d")
		filter = []
		base.each do |b|
			if b.created_at.strftime("%Y-%m-%d") == today
				filter << b
			end
		end
		base = filter
		base.sort!
	end
end
