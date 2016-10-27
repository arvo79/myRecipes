class ReviewsController < ApplicationController
  
  before_action :require_user
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.create(review_params)
    @review.chef = current_user
    @review.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    Review.find(params[:id]).destroy
    redirect_to recipe_path(@recipe)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:title, :body)
  end
  
end