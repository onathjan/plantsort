class StaticPagesController < ApplicationController
  allow_unauthenticated_access

  def home
    if authenticated?
      @categories = Current.user.categories
      @plants = filter_plants
      params[:category].nil? ? @selected_category = "All Plants" : @selected_category = params[:category]
    end
  end

  def terms
  end

  def privacy
  end

  def password_reset
  end

  private

    def filter_plants
      if params[:category].present? && valid_category?(params[:category])
        Current.user.plants.joins(:categories).where(categories: { name: params[:category] }).order(created_at: :desc)
      else
        Current.user.plants.order(created_at: :desc)
      end
    end

    def valid_category?(category)
      Category.exists?(name: category)
    end
end
