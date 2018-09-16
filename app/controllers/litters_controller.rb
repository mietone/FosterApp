class LittersController < ApplicationController
  before_action :find_litter, only: [:show, :edit, :update, :destroy]

  def index
    @litters = Litter.all.order("created_at DESC")
  end

  def show
  end

  def new
    @litter = Litter.new
  end

  def create
    @litter = current_user.litters.new(litter_params)

    if @litter.save
      redirect_to @litter
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def litter_params
    params.require(:litter).permit(:name, :start_date, :end_date, :with_mom, :mom_name)
  end

  def find_litter
    @litter = Litter.find(params[:id])
  end

end
