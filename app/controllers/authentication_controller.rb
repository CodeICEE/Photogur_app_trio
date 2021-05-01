class AuthenticationController < ApplicationController

    skip_before_action :authenticate, only: [:login]

    def login
        @user = User.find_by(username: params[:username])
        if @user
            if(@user.authenticate(params[:password]))

            else
                render json: { message: "Authentication Failed"}
            end
        else
            render json: { message: "Could not find user"}
        end
    end

end
