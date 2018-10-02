class LittersController < ApplicationController
  before_action :find_litter, only: [:show, :edit, :update, :destroy]

  def index
    @litters = Litter.all.order("start_date DESC")
  end

  def my_litters
    @litters = Litter.all.order("start_date DESC")
    @my_litters = @litters.my_litters(current_user)
  end

  def show
    @kittens = @litter.kittens
  end

  def new
    @litter = Litter.new
    @litter.kittens.build(user_id: current_user.id)
  end

  def create
    @litter = Litter.new(litter_params)

    if @litter.save
      flash[:success] = "Litter was successfully created."
      redirect_to @litter
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @litter.update(litter_params)
      flash[:notice] = "Litter has been updated."
      redirect_to @litter
    else
      render :edit
    end
  end

  def destroy
    if @litter.destroy
      flash[:notice] = "Litter was successfully deleted."
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
        :image,
        :dob,
        :image_cache,
        :remove_image,
        :_destroy
      ]
    )
  end

  def find_litter
    @litter = Litter.find(params[:id])
  end

end
