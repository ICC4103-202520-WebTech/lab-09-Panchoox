class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] ##autentica el user en toods menos en index y show
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

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
  
  def authorize_user! ## el ! significa que este metodo tiene un efecto secundario osea el redirect_to en este caso
    unless @recipe.user == current_user
      redirect_to recipes_path, alert: "No tienes permiso para esto"
  
    end
  end

  protected
  def config_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end