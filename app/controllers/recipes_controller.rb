class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
    @recipes = Recipe.all
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  def create
    @recipe = current_user.recipes.build(recipe_params)
  
    if @recipe.save
      redirect_to @recipe, notice: "Receta creada exitosamente"
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Receta actualizada exitosamente"
    else
      flash.now[:alert] = @recipe.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: "Receta eliminada"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :difficulty, :instructions)
  end
  
  # authorization handled by CanCanCan (Ability)

end