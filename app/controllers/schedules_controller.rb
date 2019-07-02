class SchedulesController < ApplicationController

	def index
		@schedules = Schedule.order :date, :hour
	end

	def day
		today = Time.now
		today = today.strftime("%Y-%m-%d")
		@schedules = Schedule.where "date like ?", "%#{today}%"
		@schedules = @schedules.order :hour
	end

	def new
		@studant = Studant.find(params[:id])
		@schedule = Schedule.new
		@schedule.studant_id = @studant.id
		if @studant.procedure.last != nil && @studant.procedure.last.status == 'Aberto'
			@schedule.save
		else
			@message = 'Aluno nao tem Processo Aberto'
			render 'select'
		end
	end

	def registred_class
		schedule = Schedule.find(params[:id])
		procedure = schedule.studant.procedure.last.id
		schedule.destroy

		redirect_to procedure_class_path(procedure)
	end

	def update
		@schedule = Schedule.find(params[:id])
		date = params[:date].to_time
		hour = params[:hour]
		@schedule.update(date: date, hour: hour)
		redirect_to schedules_day_path, notice: 'Agendamento Salvo!'
	end

	def filter_date
		@schedules = Schedule.all
		@select_date = params[:select_date]

		filter = []

		@schedules.each do |schedule|
			if schedule.date.strftime("%Y-%m-%d") == @select_date
				filter << schedule
			end
		end
		@schedules = filter
	end

	def destroy
		id = params[:id]
		Schedule.destroy id
		redirect_to schedules_path, notice: 'Agendamento Excluído!'
	end
end
