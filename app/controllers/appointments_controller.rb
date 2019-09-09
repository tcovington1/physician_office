class AppointmentsController < ApplicationController
  before_action :set_physician
  before_action :set_appointment, except: [:new]

  def index
    @appointments = @appointment.physician.where(name: @physician.name)
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment 
    else
      render :new
    end
  end

  def edit
     
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to physician_appointment_path(@physician, @appointment)
    else
      render :edit
    end
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

  def set_appointment
      @appointment = Appointment.find(params[:id])
  end

end
