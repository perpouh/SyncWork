# frozen_string_literal: true

# This file is part of the Project Management System.
# It is subject to the license terms in the LICENSE file found in the top-level directory of this distribution and at
#
class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]
  respond_to :json

  def index
    @projects = Project.all
    render json: @projects, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def show
    render json: @project, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  def destroy
    if @project.destroy
      render json: { message: 'Project deleted successfully' }, status: :ok
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Project not found' }, status: :not_found
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date)
  end
end
