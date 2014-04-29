class SweetsController < ApplicationController
  before_action :set_sweet, only: [:show, :edit, :update, :destroy]
  before_filter :load_swit 
  # GET /sweets
  # GET /sweets.json
  def index
    @sweets = Sweet.all
  end

  # GET /sweets/1
  # GET /sweets/1.json
  def show
    @sweet = @swit.sweets.find(params[:id])
  end

  # GET /sweets/new
  def new
   @sweet = @swit.sweets.new
  end

  # GET /sweets/1/edit
  def edit

  end

  # POST /sweets
  # POST /sweets.json
  def create
  @sweet = @swit.sweets.new(sweet_params)
  @swits = Swit.all
  @sweet.user_id= current_user.username
      respond_to do |format|
        if @sweet.save
          
          format.html { redirect_to swits_path, notice: 'Sweet <3.' }
          format.json { render action: 'new', status: :created, location: @sweet }
        else
          format.html { render action: 'new' }
          format.json { render json: @swit.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /sweets/1
  # PATCH/PUT /sweets/1.json
  def update
    respond_to do |format|
      if @sweet.update(sweet_params)
       format.html { redirect_to swits_path, notice: 'Sweet <3.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sweets/1
  # DELETE /sweets/1.json
  def destroy
    @sweet = @swit.sweets.find(params[:id])
     @sweet.destroy
    respond_to do |format|
      format.html { redirect_to swit_sweets_path(@swit) }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sweet
      #@sweet =  @swits.sweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sweet_params
      params.require(:sweet).permit(:user_id, :swit_id)
    end

     def load_swit
     @swit = Swit.find(params[:swit_id])
  end
end
