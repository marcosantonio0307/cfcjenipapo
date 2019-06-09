class StudantsController < ApplicationController

	def index
		@studants = Studant.all
	end
	
	def new
		@studant = Studant.new
	end

	def create
		values = params.require(:studant).permit!
		@studant = Studant.create values
		if @studant.save
			redirect_to studants_path, notice: 'Cadastro efetuado com sucesso!'
		else
			render :new
		end
	end

	def edit
		@studant = Studant.find(params[:id])
	end

	def update
		@studant = Studant.find(params[:id])
		values = params.require(:studant).permit!
		@studant.update values

		if @studant.save
			redirect_to studants_path, notice: 'Cadastro alterado com sucesso!'
		else
			render :edit
		end
	end

	def destroy
		id = params[:id]
		Studant.destroy id
		redirect_to studants_path, notice: 'Cadastro excluído com sucesso!'
	end

	def show
		@studant = Studant.find(params[:id])
	end
end
