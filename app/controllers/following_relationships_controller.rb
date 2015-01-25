class FollowingRelationshipsController < ApplicationController
  def create
    user_to_follow = User.find(params[:user_id])
    current_user.follow(user_to_follow)

    redirect_to :back
  end
end
