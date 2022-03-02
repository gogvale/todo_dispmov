# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, except: %i[index create]
  def index
    @users = User.all
    render json: UserBlueprint.render(@users), status: :ok
  end

  def show
    render json: UserBlueprint.render(@user), status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserBlueprint.render(@user), status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: UserBlueprint.render(@user), status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User destroyed successfully' }, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(id: params[:id])
    raise UserNotFound unless @user
  end
end
