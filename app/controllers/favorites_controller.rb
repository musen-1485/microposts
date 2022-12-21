class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    Favorite.create(user_id: current_user.id, micropost_id: params[:id])
    flash[:success] = "お気に入りに追加しました。"
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, micropost_id: params[:id])
    favorite.destroy
    flash[:success] = "お気に入りから外す"
    redirect_to root_path
  end
  
 
  
end
