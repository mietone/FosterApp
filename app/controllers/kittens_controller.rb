class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update, :destroy]

  def new
    @litter = Litter.find(params[:litter_id])
    @kitten = Kitten.new
  end

  def create
    @kitten = Litter.kittens.new(kitten_params)
    if @kitten.save
      redirect_to litter_kitten_path(@litter, @kitten)
    else
      redirect_to litter_path(@litter)
    end
  end

  def show
    @litter = @kitten.litter
  end

  private

  def kitten_params
    params.require(:kitten).permit(
      :id,
      :user_id,
      :litter_id,
      :name,
      :sex,
      :color,
      :image,
      :image_cache,
      :remove_image,
      :_destroy
    )
  end

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end

end
