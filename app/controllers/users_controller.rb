# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user, status: :ok
    else
      render(json: { message: 'User not found' }, status: :bad_request)
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render(json: { message: 'User not found' }, status: :bad_request)
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      if @user.destroy
        render json: { message: 'User destroyed successfully' }, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render(json: { message: 'User not found' }, status: :bad_request)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
