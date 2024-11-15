class PlantsController < ApplicationController
  before_action :set_plant, only: [ :edit, :update, :destroy ]
  def new
    @plant = Plant.new
  end

  def create
    # Ensure category_ids is an array (in case of unselected checkboxes)
    params[:plant][:category_ids] ||= []

    @plant = Current.user.plants.new(plant_params)
    @plant.categories = Category.find(params[:plant][:category_ids])

    if @plant.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # Ensure category_ids is an array (in case of unselected checkboxes)
    params[:plant][:category_ids] ||= []

    @plant.categories = Category.find(params[:plant][:category_ids])

    if @plant.update(plant_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @plant.destroy
    redirect_to root_path
  end

  def set_plant
    @plant = Current.user.plants.find(params[:id])
  end

  private
    def plant_params
      params.expect(plant: [ :name, :taxonomic_name, category_ids: [] ])
    end
end
