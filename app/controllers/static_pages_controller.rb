class StaticPagesController < ApplicationController
  allow_unauthenticated_access
  def home
    if authenticated?
      @plants = Current.user.plants.order(created_at: :desc)
      @categories = Category.all
    end
  end

  def terms
  end

  def privacy
  end

  def password_reset
  end
end
