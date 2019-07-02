class PortionsController < ApplicationController

	def index
		@procedure = Procedure.find(params[:procedure_id]) 
		@portions = Portion.where(procedure_id: params[:procedure_id])
	end

	def pending
		@portions = Portion.where(status: 'pendente')
		@portions = @portions.order :due_date
	end

	def arrears
		@portions = Portion.where(status: 'pendente')
		today = Time.now
		today = today.strftime("%Y-%m-%d")
		filter = []

		@portions.each do |portion|
			if portion.due_date.strftime("%Y-%m-%d") < today
				filter << portion
			end
		end

		@portions = filter
	end

	def new
		@procedure = Procedure.find(params[:procedure_id])
		payment = params[:payment]
		number_portions = params[:number_portions]
		number_portions	= number_portions.to_i
		due_date = params[:due_date]
		due_date = due_date.to_time
		total = params[:total]

		if payment == 'a vista'
			today = Time.now
			portion = Portion.new due_date: today, price: total, status: 'pago', procedure_id: @procedure.id
			portion.save
			cash = Cash.create(category: 'Receita', price: portion.price, description: portion.procedure.studant.name)
			redirect_to procedures_path, notice: 'Processo cadastrado com sucesso'
		else
			portion_price = total.to_f/number_portions
			last_date = 0
			for i in 1..number_portions
				portion = Portion.new due_date: due_date+last_date.days, price: portion_price, status: 'pendente', procedure_id: @procedure.id
				portion.save
				i += 1
				last_date += 30
			end
			redirect_to procedures_path, notice: 'Processo cadastrado com sucesso'
		end		
	end

	def filter_date
		@portions = Portion.where(status: 'pendente')
		@begin_date = params[:begin_date]
		@end_date = params[:end_date]

		filter = []

		if @begin_date > @end_date
			render :index
		else
			@portions.each do |portion|
				if portion.due_date.strftime("%Y-%m-%d") == @begin_date
					filter << portion
				elsif portion.due_date.strftime("%Y-%m-%d") > @begin_date && portion.due_date.strftime("%Y-%m-%d") < @end_date
					filter << portion
				elsif portion.due_date.strftime("%Y-%m-%d") == @end_date
					filter << portion
				end
			end
			@portions = filter
		end
	end

	def edit
		@procedure = Procedure.find(params[:procedure_id])
		@portion = Portion.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:procedure_id])
		values = params.require(:portion).permit!
		@portion = Portion.find(params[:id])
		@portion.update values
		redirect_to procedure_path(@procedure)
	end

	def pay
		@portion = Portion.find(params[:id])
		@portion.update(status: 'pago')
		cash = Cash.create(category: 'Receita', price: @portion.price, description: @portion.procedure.studant.name)
		if cash.save
			redirect_to portions_pending_path, notice: 'Recebimento Registrado com Sucesso!'
		end
	end

	def destroy
		@procedure = Procedure.find(params[:procedure_id])
		id = params[:id]
		Portion.destroy id
		redirect_to procedure_path(@procedure), notice: 'Parcela Excluida!'
	end

end