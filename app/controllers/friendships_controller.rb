class FriendshipsController < ApplicationController
  def create
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @friendship = @current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added friend.'
    else
      flash[:error] = 'Error occurred when adding friend.'
    end
    redirect_to root_url
  end

  def destroy
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @friendship = @current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Successfully destroyed friendship.'
    redirect_to root_url
  end
end
