class ShoutsController < ApplicationController
  def index
    @shout = Shout.new
    @timeline = current_user.timeline
  end

  def create
    shout = current_user.shouts.create(shout_params)
    if shout.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
