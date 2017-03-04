class PatientsController < ApplicationController
  def index
    @hosiptal = Hosiptal.find(params[:hosiptal_id])
    @patients = @hospital.patients
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to controller: :patients, action: :show, id: @patient.id,  notice: "登録しました"
    else
      @patient = Patient.find(params[:patient_id])
      render action: :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to controller: :patients, action: :show, id: @patient.id,  notice: "編集しました"
    else
      @patient = Patient.find(params[:patient_id])
      render action: :edit
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :birthday, :postcode, :address, :tel, :mail, :disease).merge(hosiptal_id: params[:hosiptal_id])
  end
end
