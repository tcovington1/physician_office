class AppointmentsController < ApplicationController
  before_action :set_physician
  def index
    @appointments = @appointment.physician.where(name: @physician.name)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
  end

  def edit
    @appointment = Appointment.find(params[:id])
     render partial: 'form'
  end

  private
  def physician_params
    params.require(:billboard).permit(:name, :specialty)
  end
  
  def appointment_params
    params.require(:appointment).permit(:date, :time)
  end

  def set_physician
    @physician = Physician.find(params[:physician_id])
  end

end
