class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save
      flash[:notice] = 'You have successfully signed up!'
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
end
