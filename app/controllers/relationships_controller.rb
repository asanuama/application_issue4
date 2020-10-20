class RelationshipsController < ApplicationController
  # フォローを作成
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
    # 遷移前ののurlへ
  end

  # フォローを削除
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
    # 遷移前ののurlへ
  end
  
  # 自分がフォローしているuser一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

 # 自分をフォローしているuser一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
  
end

