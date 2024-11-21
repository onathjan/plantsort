class CategoriesController < ApplicationController
  def index
    @categories = Current.user.categories
  end

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
    @category = Current.user.categories.find(params[:id])
  end

  def update
    @category = Current.user.categories.find(params[:id])

    if @category.update(category_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Current.user.categories.find(params[:id]).destroy
    redirect_to root_path, notice: "Category successfully destroyed."
  end

  private
    def category_params
      params.expect(category: [ :name, :user_id ])
    end
end
