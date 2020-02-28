class ActivitiesController < ApplicationController
  before_action :set_user
  before_action :set_user_activity, only: %i[show update destroy]

  # GET /users/:user_id/activities
  def index
    json_response(@user.activities)
  end

  # GET /users/:user_id/activities/:id
  def show
    json_response(@activity)
  end

  # POST /users/:user_id/activities
  def create
    @user.activities.create!(activity_params)
    json_response(@user, :created)
  end

  # PUT /users/:user_id/activities/:id
  def update
    @activity.update(activity_params)
    head :no_content
  end

  # DELETE /users/:user_id/activities/:id
  def destroy
    @activity.destroy
    head :no_content
  end

  private

  def activity_params
    params.permit(:kind, :amount)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_activity
    @activity = @user.activities.find_by!(id: params[:id]) if @user
  end
end
