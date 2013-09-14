class UsersController < ApplicationController
  respond_to :json
  before_filter :authenticate, :except => [:index, :show, :create]

  def index
    respond_with users, :except => User::RESTRICTED_FIELDS
  end

  def show
    respond_with user, :only => available_fields
  end

  def update
    user.update_attributes(params[:user])

    respond_with user
  end

  def create
    user.update_attributes(params[:user])

    respond_with user, :only => available_fields
  end

  private
    def user
      @user ||= params[:id] ? User.find(params[:id]) : User.new
    end

    def users
      User.all
    end

    def available_fields
      authenticated? ? User.column_names : User.column_names - User::RESTRICTED_FIELDS
    end

    def authenticated?
      user and user.uuid == params[:uuid] and user.secret_token == params[:secret_token]
    end

    def authenticate
      render :status => :forbidden, :text => "You must be authenticated", :template => false if !authenticated?
    end

end
