class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  layout 'profile', only: [:profile]
  include SessionsHelper
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def alluser
    @users = User.all
  end

  def friends
    @users = User.all
    @friends ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def profile
    @profile ||= User.find_by_remember_token(cookies[:remember_token])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @hours = Hour.where(user_id: @user.id).order('created_at DESC').includes(:group)
    @time = @hours.to_a.map { |x| x[:amount] }.sum
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to '/profile', notice: 'User was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :avatar)
  end
end
