class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def create
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      render json: @user.to_json, status: :created
    else
      render json: { errors: @user.errors } , status: 400
    end
    
  end

  def user_votes
    us = UserVote.where(user_id: params[:user_id])
    render json: us, status: 200
  end

  def vote
    user = User.find_by(token: params[:token])
    user_vote = UserVote.new(vote_params)
    if user.present? && user_vote.save
      render json: user_vote, status: :created
    else
      render json: user_vote.errors, status: 400
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  def update
    if @user.update(users_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end
  
  private 

  def vote_params
    params.require(:user_votes).permit(:movie_id, :director_id, :user_id)
  end
  
  def users_params
    params.require(:users).permit(:email,:password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
