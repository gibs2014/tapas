class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
  end

  def create
    @recipe = Recipe.new
    @recipe.name = params[:name]
    @recipe.category = params[:category]
    @recipe.quantity = params[:quantity]
    @recipe.calories = params[:calories]
    @recipe.preparation = params[:preparation]
    @recipe.prep_time = params[:prep_time]

    if @recipe.save
      redirect_to recipes_url, notice: "Recipe created successfully."
    else
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.name = params[:name]
    @recipe.category = params[:category]
    @recipe.quantity = params[:quantity]
    @recipe.calories = params[:calories]
    @recipe.preparation = params[:preparation]
    @recipe.prep_time = params[:prep_time]

    if @recipe.save
      redirect_to recipes_url, notice: "Recipe updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy

    redirect_to recipes_url, notice: "Recipe deleted."
  end
end
