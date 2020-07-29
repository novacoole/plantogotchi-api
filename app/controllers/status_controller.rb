class StatusController < ApplicationController
  before_action :authenticate_user

  def index
    render json: { message: 'logged in', admin: current_user.admin? }
  end

  def user
    render json: { user: current_user.email }
  end
end
