class ApplicationController < ActionController::Base

   # before_action :authenticate

    # def authenticate
    #     if request.headers["Authorization"]
    #         begin
    #             auth_header = request.headers["Authorization"]
    #             decode_token = JWT.decode(token, secret)
    #             payload = decode_token.first
    #             user_id = payload["user_id"]
    #             @user = User.find(user_id)
    #         rescue => exception
    #             render json: { message: "Error: #{exception}"}, status: :forbidden
    #         end
    #     else
    #         render json: {message: "no Authorization header sent"}, status: :forbidden
    #     end
    # end

    # def secret
    #     secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
    # end

    # def token
    #     auth_header.split(" ")[1]
    # end

    # def create_token(payload)
    #     JWT.encode(payload, secret)
    # end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user
    
      def authorize
        redirect_to '/login' unless current_user
      end


end
