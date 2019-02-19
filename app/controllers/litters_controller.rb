class LittersController < ApplicationController
  before_action :find_litter, only: [:show, :edit, :update, :destroy, :next_kitten]

  def index
    @litters = Litter.all.order("start_date DESC")
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @litters}
    end
  end

  def my_litters
    @litters = Litter.all.order("start_date DESC")
    @my_litters = @litters.my_litters(current_user).uniq
  end

  def with_mom
    @litters = Litter.all.order("start_date DESC")
    @with_mom = @litters.with_mom
  end

  def show
    @kittens = @litter.kittens
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @kittens}
    end
  end

  def new
    @litter = Litter.new
    @litter.kittens.build(user_id: current_user.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    # result = Cloudinary::Uploader.upload(
    #   params["litter"]["kittens_attributes"][0]["image"],
    #   :resource_type => :image
    # )
    #
    # @kitten = Kitten.new(url: result["url"])
    # binding.pry
    # @litter = Litter.create(name: params["litter"]["name"])
    # @kitten = Kitten.new(name: params["litter"]["kitten"]["name"], user_id: current_user.id)
    # @kitten.save
    # @litter.kittens.push(@kitten)
    @litter = Litter.new(litter_params)

    respond_to do |format|
      if @litter.save
        # render 'litters/input.html.erb', :layout => false
        format.html { redirect_to @litter, success: 'Litter was successfully created.' }
        format.json { render json: @litter, success: 'Litter was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @litter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @litter.update(litter_params)
      flash[:notice] = "Litter has been updated."
      redirect_to @litter
    else
      flash[:error] = @litter.errors.full_messages.to_sentence
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
