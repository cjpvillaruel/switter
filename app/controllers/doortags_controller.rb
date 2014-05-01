class DoortagsController < ApplicationController
  before_action :set_doortag, only: [:show, :edit, :update, :destroy]

  # GET /doortags
  # GET /doortags.json
  def index
    @doortags = Doortag.all
   # @doortags = Doortag.select(:tag).distinct
  end

  # GET /doortags/1
  # GET /doortags/1.json
  def show
    #@tag = Doortag.new(params(:id, :doortag))
    #@doortags= Doortag.where(tag: params(:id))

  end

  # GET /doortags/new
  def new
    @doortag = Doortag.new
  end

  def showdoortags
      @tag=params[:doortag]
      @swits= Swit.all
      @doortags= Doortag.where(tag: @tag)

  end
  # GET /doortags/1/edit
  def edit
  end

  # POST /doortags
  # POST /doortags.json
  def create
    @doortag = Doortag.new(doortag_params)

    respond_to do |format|
      if @doortag.save
        format.html { redirect_to @doortag, notice: 'Doortag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @doortag }
      else
        format.html { render action: 'new' }
        format.json { render json: @doortag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doortags/1
  # PATCH/PUT /doortags/1.json
  def update
    respond_to do |format|
      if @doortag.update(doortag_params)
        format.html { redirect_to @doortag, notice: 'Doortag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @doortag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doortags/1
  # DELETE /doortags/1.json
  def destroy
    @doortag.destroy
    respond_to do |format|
      format.html { redirect_to doortags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doortag
      @doortag = Doortag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doortag_params
      params.require(:doortag).permit(:tag, :swit_id)
    end
end
