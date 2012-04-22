class DataSourcesController < ApplicationController

  def show
    @data_source = DataSource.find(params[:id])
    @tags = @data_source.tags
    @categories = @data_source.categories
    @curators = @data_source.curators

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @data_source }
    end
  end
end
