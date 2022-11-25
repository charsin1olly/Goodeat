class FoodsController < ApplicationController  
  # before_action :authenticate_user! ,only: [:show ]
  before_action :find_food ,only: [:show ,:edit ,:update ,:destroy ,:buy]
  
  def index
    @foods=Food.all
  end

  def new
    @food=Food.new
  end

  def create
    @food= current_user.foods.build(clean_food_params)
    
    if @food.save
      redirect_to foods_path ,notice:"新增成功"
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @food.update(clean_food_params)
      redirect_to foods_path ,notice:"修改成功"
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path ,notice:"刪除成功"
  end

  def buy
    # render html:params
  end


  private
  def clean_food_params
    params.require(:food).permit(:img, :title , :price , :description)
  end

  def find_food
    @food=Food.find_by(params[:id])
  end
end
