class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy, :doortagview]

  before_filter :authenticate_user!
 
  
  # GET /swits
  # GET /swits.json
  def index
    @swits = Swit.order(created_at: :desc)
    @swit = Swit.new

  end

  # GET /swits/1
  # GET /swits/1.json
  def show
  end

  # GET /swits/new
  def new
    @swit = Swit.new
  end
  # show door tags
  def doortagview
    

  end
  # GET /swits/1/edit
  def edit
  end



  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)
    @swit.user_id= current_user.username

    @post =@swit.post
    

    #render :text => @tags
   respond_to do |format|
      if @swit.save
        @tags= @post.scan(/\{[^}]*\}/)

        @tags.each do |doortag|
            @doortag =  Doortag.new(swit_id: @swit.id, tag: doortag)
            @doortag.save
        end
       format.html { redirect_to swits_path, notice: 'Swit was successfully created.' }
       format.json { render action: 'show', status: :created, location: @swit }
     else
       format.html { render action: 'new' }
       format.json { render json: @swit.errors, status: :unprocessable_entity }
     end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    respond_to do |format|
      if @swit.update(swit_params)
        format.html { redirect_to @swit, notice: 'Swit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    @swit.destroy
    respond_to do |format|
      format.html { redirect_to swits_url }
      format.json { head :no_content }
    end
  end
   def load_swit
     @swit = Swit.find(params[:swit_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:post)
    end
end
