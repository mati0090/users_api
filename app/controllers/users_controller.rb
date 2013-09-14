class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with users, :except => User::RESTRICTED_FIELDS
  end

  def show
    respond_with user, :only => showable_fields
  end

  private
    def user
      User.find(params[:id]) if params[:id]
    end

    def users
      User.all
    end

    def showable_fields
      authenticated? ? User.column_names : User.column_names - User::RESTRICTED_FIELDS
    end

    def authenticated?
      user and user.uuid == params[:uuid] and user.secret_token == params[:secret_token]
    end

end
