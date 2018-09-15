class LittersController < ApplicationController
  before_action :find_litter, only: [:show, :edit, :update, :destroy]

  def index
    @litters = Litter.all.order("created_at DESC")
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def litter_params
    params.require(:litter).premit(:name, :start_date, :end_date, :with_mom, :mom_name)
  end

  def find_litter
    @litter = Litter.find(params[:id])
  end

end
