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
    # @physician = Physician.all
    # Set a variable @patients so you can loop/map through
    # your patients for a drop down select so create the association
    @appointment = @physician.appointments.new
  end

  def create
    @appointment = @patient.appointments.new(appointment_params)

    if @appointment.save
      redirect_to physician_path(@physician)
    else
      render :new
    end
  end

  def edit
     
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to physician_appointment_path(@physician)
    else
      render :edit
    end
  end

  def destroy
    @appointment = @physician.appointments.find(params[:id])
    binding.pry
    @appointment.destroy
    
    redirect_to physician_path(@physician)
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
