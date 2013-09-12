class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with users
  end

  def show
    respond_with user
  end

  private
    def user
      User.find(params[:id])
    end

    def users
      User.all
    end

end
