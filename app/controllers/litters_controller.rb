class LittersController < ApplicationController
  before_action :find_litter, only: [:show, :edit, :update, :destroy]

  def index
    @litters = Litter.all.order("created_at DESC")
  end

  def show
    @kittens = @litter.kittens
  end

  def new
    @litter = Litter.new
    @litter.kittens.build(user_id: current_user.id)
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
    if @litter.update(litter_params)
      redirect_to @litter
    else
      render :edit
    end
  end

  def destroy
    if @litter.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def litter_params
    params.require(:litter).permit(
      :name,
      :start_date,
      :end_date,
      :with_mom,
      :mom_name,
      kittens_attributes: [
        :id,
        :user_id,
        :litter_id,
        :name,
        :sex,
        :color,
        :_destroy
      ]
    )
  end

  def find_litter
    @litter = Litter.find(params[:id])
  end

end
