class CuratorsController < ApplicationController
  layout 'fluid'

  def index
    @curators = Curator.all(:order => :org)
    @curator = if (params[:id])
      Curator.find(params[:id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @curators }
    end
  end

  def show
    @curator = Curator.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @curator }
    end
  end
end
