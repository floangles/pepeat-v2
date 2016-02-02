class CommentsController < ApplicationController

   before_action :authenticate_user!

  def create
    respond_to do |format|
      @meal = Meal.find(params[:comment][:meal_id])
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          flash[:success] = 'Your comment was successfully posted!'
        else
          flash[:error] = 'Your comment cannot be saved.'
        end

        format.html {redirect_to root_url}

        format.js {}

      else
        format.html {redirect_to root_url}
        format.js {render nothing: true}
      end
    # redirect_to meal_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :meal_id, :user_id)
  end


end


# format.js {@comments = @meal.comments.order('created_at DESC')}
