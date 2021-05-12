# frozen_string_literal: true

class PatientsController < ApplicationController
  before_action :validate_state, only: :create
  after_action :assign_doctor, only: :create

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = 'You have successfully signed up!'
      redirect_to root_path
    else
      flash[:danger] = 'We were unable to create your patient profile.'
      redirect_to root_path
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:name, :email, :birthdate, :state_id)
  end

  def assign_doctor
    response = HTTParty.post(
      DOCTOR_API_ENDPOINT,
      body: {
        name: @patient.name,
        email: @patient.email,
        date_of_birth: @patient.birthdate,
        state: @patient.state.abbreviation
      }
    )

    @patient.update(
      doctor_name: response.dig('details', 'doctor'),
      doctor_token: response.dig('details', 'token')
    )
  end

  def validate_state
    state = State.find(patient_params[:state_id])
    return if state.service_offered

    flash[:danger] = 'We\'re sorry, but our services are not available in your state at this time'
    redirect_to root_path
  end
end
