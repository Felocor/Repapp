class PagesController < ApplicationController
  def home
  end

  def user
    @user = User.find(params[:id])
  end
end
