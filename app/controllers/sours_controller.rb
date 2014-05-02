class SoursController < ApplicationController
  before_action :set_sour, only: [:show, :edit, :update, :destroy]

  before_filter :load_swit 
  # GET /sours
  # GET /sours.json
  def index
     @sours = @swit.sours.all
      
  end

  # GET /sours/1
  # GET /sours/1.json
  def show
    @sour = @swit.sours.find(params[:id])
  end

  # GET /sours/new
  def new
   @sour = @swit.sours.new
  end

  # GET /sours/1/edit
  def edit

  end

  # POST /sours
  # POST /sours.json
   def create
  @sour = @swit.sours.new(sour_params)
  @swits = Swit.all
    @checksweet = Sweet.where(swit_id: params[:swit_id], user_id: current_user.username).first;
  @check= Sour.where(swit_id: params[:swit_id], user_id: current_user.username).first;
  #render :text => @swits
  if( @check != nil )
    @check.destroy
     respond_to do |format|
        format.html { redirect_to swits_path, notice: 'Unsour.' }
          format.json { render action: 'new', status: :created, location: @sour }
     end
  elsif @checksweet != nil
      @checksweet.destroy
      respond_to do |format|
        format.html { redirect_to swits_path, notice: 'Unsweet.' }
        format.json { render action: 'new', status: :created, location: @sour }
     end
  elsif @checksweet == nil and @check == nil
  @sour.user_id= current_user.username
      respond_to do |format|
        if @sour.save
         
          format.html { redirect_to swits_path, notice: 'Sour </3.' }
          format.json { render action: 'new', status: :created, location: @sour }
        else
          format.html { render action: 'new' }
          format.json { render json: @swit.errors, status: :unprocessable_entity }
        end
      end
    end
  
    end

  # PATCH/PUT /sours/1
  # PATCH/PUT /sours/1.json
  def update
    respond_to do |format|
      if @sour.update(sour_params)
       format.html { redirect_to swits_path, notice: 'sour <3.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sours/1
  # DELETE /sours/1.json
  def destroy
    @sour = @swit.sours.find(params[:id])
     @sour.destroy
    respond_to do |format|
      format.html { redirect_to swit_sours_path(@swit) }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sour
      #@sour =  @swits.sour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sour_params
       params.require(:sour).permit(:user_id, :swit_id)
    end

     def load_swit
     @swit = Swit.find(params[:swit_id])
  end
end