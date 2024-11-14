class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Current.user.plants.new(plant_params)
    @plant.categories = Category.find(params[:plant][:category_ids])

    if @plant.save
      redirect_to root_path, notice: "Plant successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @plant = Current.user.plants.find(params[:id])
  end

  def update
    @plant = Current.user.plants.find(params[:id])
    @plant.categories = Category.find(params[:plant][:category_ids])

    if @plant.update(plant_params)
      redirect_to root_path, notice: "Plant successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Current.user.plants.find(params[:id]).destroy
    redirect_to root_path, notice: "Plant successfully deleted."
  end

  private
    def plant_params
      params.expect(plant: [ :common_name, :taxonomic_name ])
    end
end
