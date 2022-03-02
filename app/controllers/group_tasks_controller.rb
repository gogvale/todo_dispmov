# frozen_string_literal: true

class GroupTasksController < ApplicationController
  before_action :find_group
  before_action :set_task, only: %i[show update destroy]

  # GET /group_tasks
  def index
    @group_tasks = @group.group_tasks

    render json: @group_tasks
  end

  # GET /group_tasks/1
  def show
    render json: @group_task
  end

  # POST /group_tasks
  def create
    @group_task = @group.group_tasks.new(task_params)

    if @group_task.save
      render json: @group_task, status: :created
    else
      render json: @group_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /group_tasks/1
  def update
    if @group_task.update(task_params)
      render json: @group_task
    else
      render json: @group_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /group_tasks/1
  def destroy
    @group_task.destroy
  end

  private

  def find_group
    @group = Group.find(params[:group_id])
    raise GroupNotFound unless @group
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @group_task = GroupTask.joins(:assignee).find_by(id: params[:id])
    raise GroupTaskNotFound unless @group_task
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:group_task).permit(:assignee_id, :completed, :description, :parent_id)
  end
end
