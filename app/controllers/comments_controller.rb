class CommentsController < ApplicationController
  before_action :find_food ,only: [:create]
  before_action :find_comment ,only: [:destroy]

  def create
    @comment = @food.comments.new(clean_comment_params)

    if @comment.save
      redirect_to food_path(@food) ,notice:"留言成功"
    else
      redirect_to food_path(@food) ,alert:"請輸入留言"
    end
  end

  def destroy

  end

  private
  def clean_comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
    # params.require(:comment).permit(:content).merge(user: current_user)
  end
  
  def find_food
    @food=current_user.foods.find(params[:food_id])
    # @wish_list = current_user.wish_lists.find(params[:id])
  end

  def find_comment
    @comment=current_user.comments.find(params[:id])
    # @comment = current_user.comments.find(params[:id])
  end

end
