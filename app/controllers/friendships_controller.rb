class FriendshipsController < ApplicationController
    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        redirect_to user
    end

    def destroy

    end
end
