class PagesController < ApplicationController
  def index
    @tags = Tag.find_random(10)
    @categories = Category.find_random(10)
    @curators = []
  end

  def about
  end

end
