class LittersController < ApplicationController

  def index
    @litters = Litter.all.order("created_at DESC")
  end

end
