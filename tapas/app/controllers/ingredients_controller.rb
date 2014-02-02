class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def new
  end

  def create
    @ingredient = Ingredient.new
    @ingredient.name = params[:name]
    @ingredient.source = params[:source]
    @ingredient.notes = params[:notes]

    if @ingredient.save
      redirect_to ingredients_url, notice: "Ingredient created successfully."
    else
      render 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find_by(id: params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.name = params[:name]
    @ingredient.source = params[:source]
    @ingredient.notes = params[:notes]

    if @ingredient.save
      redirect_to ingredients_url, notice: "Ingredient updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.destroy

    redirect_to ingredients_url, notice: "Ingredient deleted."
  end
end
