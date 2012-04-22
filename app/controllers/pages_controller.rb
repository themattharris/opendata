class PagesController < ApplicationController
  def index
    @tags = Tag.find_random(20)
    @categories = Category.find_random(20)
    @curators = Curator.find_random(5)
  end

  def about
  end

end
