class CommentsController < ApplicationController
	before_filter :load_swit 

	def new

    	@comment = @swit.comments.new
    	@comments = @swit.comments.all
    	@swits = Swit.all
	end


 	

  	def index
    	@comments = @swit.comments.all
    	
  	end

 
	  def show
	  
	  	@comment = @swit.comments.find(params[:id])

	  end

  
	  def edit

	  	@swit = Swit.find(params[:swit_id])
	  end




	  
	def create
	  
	@comment = @swit.comments.new(comments_params)
	@swits = Swit.all
	@comment.user_id= current_user.username
	    respond_to do |format|
	      if @comment.save
	      	
	        format.html { redirect_to new_swit_comment_path(), notice: 'Comment was successfully created.' }
	        format.json { render action: 'new', status: :created, location: @comment }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @swit.errors, status: :unprocessable_entity }
	      end
	    end
	  end

  def load_swit
		 @swit = Swit.find(params[:swit_id])
  end

  def update
  	@swit = Swit.find(params[:swit_id])
    respond_to do |format|
      if @comment.update(comments_params)
       
	    format.html { redirect_to [@swit, @comment], notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comments.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @swit.comments.find(params[:id])
     @comment.destroy
    respond_to do |format|
      format.html { redirect_to swit_comments_path(@swit) }
      format.json { head :no_content }
    end
  end


  def comments_params
    params.require(:comment).permit(:body, :user_id, :swit_id)
  end
end
