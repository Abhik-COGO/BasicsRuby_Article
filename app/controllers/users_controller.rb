class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end   

    def create
        @user = User.new(user_params)

        if @user.save
            payload = {user_id: @user.id}
            token = create_token(payload)
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
end