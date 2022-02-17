# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user&.authenticate(params[:user][:password])
      render(json: {
               message: 'Login successful',
               user_id: @user.id
             }, status: :ok)
    else
      render(json: {
               message: "Email and password don't match"
             }, status: :bad_request)
    end
  end
end
