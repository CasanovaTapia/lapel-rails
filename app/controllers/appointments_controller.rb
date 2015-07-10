class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @appointments = @user.appointments
  end

  def show
  end

  def new
    @appointment = @user.appointments.new
  end

  def create
    @appointment = @user.appointments.new(appointment_params)
    @appointment.user_id = @user.id
    if @appointment.save
      flash[:notice] = "Appointment was sent."
      redirect_to [@user, @appointment]
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update_attributes(appointment_params)
      flash[:notice] = "Appointment was updated."
      redirect_to [@user, @appointment]
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      flash[:notice] = "Appointment was deleted."
      redirect_to profile_view_path
    else
      flash[:error] = "Appointment was not deleted. Please try again."
      redirect_to [@appointment.user, @appointment]
    end
  end

  private

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def appointment_params
      params.require(:appointment).permit(:datetime, :location, :status, :role, :notes, :user_id)
    end
end
