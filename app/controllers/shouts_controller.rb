class ShoutsController < ApplicationController
  def index
    @shout = Shout.new
    @shouts = Shout.all.order("created_at DESC")
    @users_i_follow = current_user.followed_users
    @users_i_do_not_follow = User.where.not(id: current_user.followed_user_ids)
    @following_relationship = FollowingRelationship.new
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
