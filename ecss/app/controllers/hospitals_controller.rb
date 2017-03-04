class HospitalsController < ApplicationController
  def index
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
    if @hospital.save
      redirect_to controller: :hospitals, action: :show, id: @hospital.id,  notice: "登録しました"
    else
      @hospital = Hosiptal.find(params[:hospital_id])
      render action: :new
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update(hospital_params)
      redirect_to controller: :hospitals, action: :show, id: @hospital.id,  notice: "編集しました"
    else
      @hospital = Hospital.find(params[:hospital_id])
      render action: :edit
    end
  end

  private
  def hospital_params
    params.require(:hospital).permit(:name, :username, :tel, :mail, :postcode, :address)
  end
end
