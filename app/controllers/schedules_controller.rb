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
		@schedule.save
	end

	def update
		@schedule = Schedule.find(params[:id])
		date = params[:date].to_time
		hour = params[:hour]
		@schedule.update(date: date, hour: hour)
		redirect_to schedules_path, notice: 'Agendamento Salvo!'
	end

	def filter_date
		@schedules = Schedule.all
		@begin_date = params[:begin_date]
		@end_date = params[:end_date]

		filter = []

		if @begin_date > @end_date
			render :index
		else
			@schedules.each do |schedule|
				if schedule.date.strftime("%Y-%m-%d") == @begin_date
					filter << schedule
				elsif schedule.date.strftime("%Y-%m-%d") > @begin_date && schedule.date.strftime("%Y-%m-%d") < @end_date
					filter << schedule
				elsif schedule.date.strftime("%Y-%m-%d") == @end_date
					filter << schedule
				end
			end
			@schedules = filter
		end
	end

	def destroy
		id = params[:id]
		Schedule.destroy id
		redirect_to schedules_path, notice: 'Agendamento Excluído!'
	end
end
