class ProceduresController < ApplicationController
	def opens
		@procedures = Procedure.where(status: 'Aberto')
	end

	def closeds
		@procedures = Procedure.where(status: 'Concluido')
	end

	def index
		@procedures = Procedure.all
	end

	def new
		@procedure = Procedure.new
		@procedure.studant_id = Studant.first.id
		@procedure.class_a = 0
		@procedure.class_b = 0
		@procedure.class_t = 0
		@procedure.save
		redirect_to select_studant_procedure_path(@procedure)
	end

	def selection
		@procedure = Procedure.find(params[:id])
		cpf = params[:cpf]
		studant = Studant.where "cpf like ?", "%#{cpf}%"

		if studant.empty?
			render :select_studant
		else
			@procedure.update(studant_id: studant.first.id)
			redirect_to edit_procedure_path
		end
	end

	def edit
		@procedure = Procedure.find(params[:id])
	end

	def update
		@procedure = Procedure.find(params[:id])
		values = params.require(:procedure).permit!
		@procedure.update values

		if @procedure.portion.first != nil
			redirect_to procedures_path, notice: 'Processo Alterado com Sucesso!'
		else
			redirect_to payment_procedure_path(@procedure)
		end
	end

	def search
		@name = params[:name]
		studant = Studant.where "name like ?", "%#{@name}%"
		studant = studant.first
		@procedures = Procedure.where(studant_id: studant.id)
	end

	def payment
		@procedure = Procedure.find(params[:id])
	end

	def registred_class
		@procedure = Procedure.find(params[:id])
		if @procedure.category == 'A'
			@options = ['A', 'Teorica']
		elsif @procedure.category == 'B'
			@options = ['B', 'Teorica']
		else
			@options = ['A', 'B', 'Teorica']
		end
	end

	def new_class
		@procedure = Procedure.find(params[:id])
		category = params[:category]
		hours = params[:hours]
		hours = hours.to_f

		if category == 'A'
			total_hours = @procedure.class_a + hours
			@procedure.update(class_a: total_hours)
		elsif category == 'B'
			total_hours = @procedure.class_b + hours
			@procedure.update(class_b: total_hours)
		else
			total_hours = @procedure.class_t + hours
			@procedure.update(class_t: total_hours)
		end

		@procedure.save
		redirect_to procedure_path(@procedure), notice: 'Aula Registrada com Sucesso!'

	end

	def finish
		@procedure = Procedure.find(params[:id])
		@procedure.update(status: 'Concluido')

		redirect_to procedure_path(@procedure), notice: 'Processo Finalizado com Sucesso!'
	end
	
	def destroy
		id = params[:id]
		Procedure.destroy id

		redirect_to procedures_path, notice: 'Processo Excluido com Sucesso!'
	end

	def show
		@procedure = Procedure.find(params[:id])
		@portions = Portion.where(procedure_id: @procedure.id)
	end
end
