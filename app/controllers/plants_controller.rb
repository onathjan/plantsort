class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to root_path, notice: "Plant successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])

    if @plant.update(plant_params)
      redirect_to root_path, notice: "Plant successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Plant.find(params[:id]).destroy
    redirect_to root_path, notice: "Plant successfully deleted."
  end

  private
    def plant_params
      params.expect(user: [ :common_name, :taxonomic_name ])
    end
end
