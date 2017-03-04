class PatientsController < ApplicationController
  def index
    @hospital = Hospital.find(params[:hospital_id])
    @patients = @hospital.patients
  end

  def show
    @patient = Patient.find(params[:id])
    @hospital = @patient.hospital
  end

  def new
    @hospital = Hospital.find(params[:hospital_id])
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to controller: :patients, action: :show, id: @patient.id,  notice: "登録しました"
    else
      @patient = Patient.find(params[:id])
      @hospital = @patient.hospital
      render action: :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
    @hospital = @patient.hospital
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to controller: :patients, action: :show, id: @patient.id,  notice: "編集しました"
    else
      @patient = Patient.find(params[:id])
      @hospital = @patient.hospital
      render action: :edit
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:name, :birthday, :postcode, :address, :tel, :mail, :disease).merge(hospital_id: params[:hospital_id])
  end
end
