class StudantsController < ApplicationController

	def index
		@studants = Studant.all
	end
	
	def new
		@studant = Studant.new
	end

	def create
		cpf_registred = Studant.all.map{|s| s.cpf}
		values = params.require(:studant).permit!
		@studant = Studant.new values
		@studant.name.upcase!

		if cpf_registred.include?(@studant.cpf)
			@message = 'CPF já Cadastrado!'
			render :new
		else
			@studant.save
			if @studant.save
				redirect_to studants_path, notice: 'Cadastro efetuado com sucesso!'
			else
				@message = 'Campos Obrigatórios não Preenchidos!'
				render :new
			end
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

	def search
		@name = params[:name]
		@name.upcase!
		@studants = Studant.where "name like ?", "%#{@name}%"
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
