class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Current.user.categories.new(category_params)

    if @category.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  private
    def category_params
      params.expect(category: [ :name, :user_id ])
    end
end
