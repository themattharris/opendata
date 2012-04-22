class TagsController < ApplicationController
  layout 'fluid'

  def index
    @tags = Tag.all(:order => :title)
    @tag = if (params[:slug])
      Tag.find_by_slug(params[:slug])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  def show
    @tag = Tag.find_by_slug(params[:slug])

    respond_to do |format|
      format.xml  { render :xml => @tag }
    end
  end
end
