class KittensController < ApplicationController
  before_action :find_litter, only: [:new, :create]
  before_action :find_kitten, only: [:show, :edit, :update, :destroy, :next]

  def new
    @kitten = @litter.kittens.build
  end

  def create
    @kitten = @litter.kittens.new(kitten_params)
    @kitten.user_id = current_user.id
    if @kitten.save
      flash[:success] = "Kitten added to #{@litter.name}."
      redirect_to litter_kitten_path(@litter, @kitten)
    else
      flash[:error] = @kitten.errors.full_messages
      redirect_to :new_litter_kitten
    end
  end

  def show
    @litter = @kitten.litter
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @litter}
    end
  end

  def next
    @kittens = Kitten.all
    @next_kitten = @kittens.next(@kitten)
    render json: @next_kitten
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
      :dob,
      :image_cache,
      :remove_image,
      :_destroy
    )
  end

  def find_litter
    @litter = Litter.find(params[:litter_id])
  end

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end

end
