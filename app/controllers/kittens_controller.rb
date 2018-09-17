class KittensController < ApplicationController
  before_action :find_kitten, only: [:show, :edit, :update, :destroy]

  def show
    @litter = @kitten.litter
  end

  private

  def find_kitten
    @kitten = Kitten.find(params[:id])
  end
  
end
