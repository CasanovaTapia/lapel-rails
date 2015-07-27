class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @appointments = @user.appointments
    @appointment = @appointments.first

    if @appointments.first.nil?
      flash[:notice] = "You have no appointments, please schedule one."
      redirect_to new_user_appointment_path
    else
      authorize @appointment
    end
  end

  def show
    authorize @appointment
  end

  def new
    @appointment = @user.appointments.new
    authorize @appointment
  end

  def add
    @users = User.all.where.not(id:current_user.id)
  end

  def create
    @appointment = @user.appointments.new(appointment_params)
    @appointment.user_id = @user.id
    authorize @appointment
    if @appointment.save
      flash[:notice] = "Appointment was sent."
      redirect_to [@user, @appointment]
    else
      flash[:error] = "There was an error. Please try again."
      render :new
    end
  end

  def edit
    authorize @appointment
  end

  def update
    authorize @appointment
    if @appointment.update_attributes(appointment_params)
      flash[:notice] = "Appointment was updated."
      redirect_to [@user, @appointment]
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @appointment
    if @appointment.destroy
      flash[:notice] = "Appointment was deleted."
      redirect_to landing_dash_app_path
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
      params.require(:appointment).permit(:datetime, :location, :role, :notes, :user_id, :appointment_status_id)
    end
end
