class UsersController < ApplicationController

	def edit
		@user = current_user
	end

	def update
		user = User.find(params[:id])
		password = params[:password]
		if password != ''
			user.update(password: password)
			redirect_to root_path, notice: 'Alterado com Sucesso!'
		else
			render :edit
		end
	end
end
