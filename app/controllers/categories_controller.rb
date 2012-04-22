class CategoriesController < ApplicationController
  layout 'fluid'

  def index
    @categories = Category.all(:order => :title)
    @category = if (params[:slug])
      Category.find_by_slug(params[:slug])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  def show
    @category = Category.find_by_slug(params[:slug])

    respond_to do |format|
      format.xml  { render :xml => @category }
    end
  end
end
