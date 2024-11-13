class StaticPagesController < ApplicationController
  allow_unauthenticated_access
  def home
    @plants = Current.user.plants if authenticated?
  end

  def terms
  end

  def privacy
  end

  def password_reset
  end
end
