# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :find_user
  before_action :find_group, except: %i[create index owned_groups destroy]

  def index
    render json: GroupBlueprint.render(@user.groups), status: :ok
  end

  def owned_groups
    render json: GroupBlueprint.render(@user.owned_groups), status: :ok
  end

  def add_to_group
    User.where(id: params[:group][:user_id]).find_each do |user|
      @group.users << user # unless @group.users.find_by(id: user.id)
    end
    render json: GroupBlueprint.render(@group, view: :detailed), status: :ok
  end

  def remove_from_group
    raise UserNotFound unless @group.users.pluck(:id).include?(params[:group][:user_id])

    @group.users.delete(params[:group][:user_id])
    render json: GroupBlueprint.render(@group, view: :detailed), status: :ok
  end

  def create
    new_group = Group.new(group_params(params).merge(users: [@user]))
    if new_group.save
      render json: GroupBlueprint.render(new_group, view: :detailed), status: :created
    else
      render json: new_group.errors, status: :bad_request
    end
  end

  def show
    render json: GroupBlueprint.render(@group, view: :detailed), status: :ok
  end

  def update
    if @group.update(group_params(params))
      render json: GroupBlueprint.render(@group, view: :detailed), status: :ok
    else
      render json: @group.errors, status: :bad_request
    end
  end

  def destroy
    @group = @user.groups.find_by(id: params[:id])
    raise GroupNotFound unless @group
    raise UnauthorizedUser unless @group.owner == @user

    if @group.destroy
      render json: { message: 'Group destroyed successfully' }, status: :ok
    else
      render json: @group.errors, status: :bad_request
    end
  end

  private

  def group_params(params)
    params.require(:group).permit(:name, :owner_id)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
    raise UserNotFound unless @user
  end

  def find_group
    @group = @user.groups.find_by(id: params[:id] || params[:group_id])
    raise GroupNotFound unless @group
  end
end
