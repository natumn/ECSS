class FamiliesController < ApplicationController

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to controller: :familys, action: :show, id: @family.id,  notice: "登録しました"
    else
      @family = Family.find(params[:family_id])
      render action: :new
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
    @family = Family.find(params[:id])
    if @family.update(family_params)
      redirect_to controller: :familys, action: :show, id: @family.id,  notice: "編集しました"
    else
      @family = Family.find(params[:family_id])
      render action: :edit
    end
  end


  private
  def family_params
    params.require(:family).permit(:name, :postcode, :address, :tel, :mail).merge(patient_id: params[:patient_id])
  end
end
