# frozen_string_literal: true
class UserNotFound < StandardError; end

class GroupNotFound < StandardError; end
class GroupTaskNotFound < StandardError; end

class UnauthorizedUser < StandardError; end


class ApplicationController < ActionController::API

  rescue_from UserNotFound do |_|
    render json: { message: 'User not found' }, status: :not_found
  end
  rescue_from GroupNotFound do |_|
    render json: { message: 'Group not found' }, status: :not_found
  end
  rescue_from GroupTaskNotFound do |_|
    render json: { message: 'Group Task not found' }, status: :not_found
  end
  rescue_from UnauthorizedUser do |_|
    render json: { message: 'Unauthorized user' }, status: :unauthorized
  end
end

