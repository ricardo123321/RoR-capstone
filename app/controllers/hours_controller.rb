class HoursController < ApplicationController
  before_action :set_hour, only: [:show, :edit, :update, :destroy]

  # GET /hours
  # GET /hours.json
  def index
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @hours = Hour.where(:user_id => @current_user.id).where.not(:group_id => nil).order("created_at DESC").includes(:group) 
    @time = @hours.to_a.map{|x| x[:amount]}.sum
  end

  # GET /hours/1
  # GET /hours/1.json
  def show
  end

  def external
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @hours = Hour.where(:user_id => @current_user.id, :group_id => nil).order("created_at DESC").includes(:group) 
    @time = @hours.to_a.map{|x| x[:amount]}.sum
  end

  # GET /hours/new
  def new
    @group_options = Group.all.map{ |u| [ u.name, u.id ] }
    @hour = Hour.new
  end

  # GET /hours/1/edit
  def edit
  end

  # POST /hours
  # POST /hours.json
  def create
    @hour = Hour.new(hour_params)
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    @hour.user_id = @current_user.id
    @group_options = Group.all.map{ |u| [ u.name, u.id ] }
    
    respond_to do |format|
      if @hour.save
        format.html { redirect_to @hour, notice: 'Hour was successfully created.' }
        format.json { render :show, status: :created, location: @hour }
      else
        format.html { render :new }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hours/1
  # PATCH/PUT /hours/1.json
  def update
    respond_to do |format|
      if @hour.update(hour_params)
        format.html { redirect_to @hour, notice: 'Hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @hour }
      else
        format.html { render :edit }
        format.json { render json: @hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hours/1
  # DELETE /hours/1.json
  def destroy
    @hour.destroy
    respond_to do |format|
      format.html { redirect_to hours_url, notice: 'Hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour
      @hour = Hour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hour_params
      params.require(:hour).permit(:name, :user_id, :amount, :group_id)
    end
end
