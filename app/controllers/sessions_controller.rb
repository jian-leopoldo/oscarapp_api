class SessionsController < ApplicationController
  def login 
    user = User.find_by(email: params[:email], password: params[:password])
    if user.present?
      render json: user, status: 200
    else
      render json: {error: "usuário não existe"}, status: 400
    end
  end
end
