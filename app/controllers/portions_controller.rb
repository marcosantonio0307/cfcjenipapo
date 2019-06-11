class PortionsController < ApplicationController

	def index
		@procedure = Procedure.find(params[:procedure_id]) 
		@portions = Portion.where(procedure_id: params[:procedure_id])
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

end