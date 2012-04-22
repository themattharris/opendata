class CuratorsController < ApplicationController
  # GET /curators
  # GET /curators.xml
  def index
    @curators = Curator.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @curators }
    end
  end

  # GET /curators/1
  # GET /curators/1.xml
  def show
    @curator = Curator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @curator }
    end
  end

  # GET /curators/new
  # GET /curators/new.xml
  def new
    @curator = Curator.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @curator }
    end
  end

  # GET /curators/1/edit
  def edit
    @curator = Curator.find(params[:id])
  end

  # POST /curators
  # POST /curators.xml
  def create
    @curator = Curator.new(params[:curator])

    respond_to do |format|
      if @curator.save
        format.html { redirect_to(@curator, :notice => 'Curator was successfully created.') }
        format.xml  { render :xml => @curator, :status => :created, :location => @curator }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /curators/1
  # PUT /curators/1.xml
  def update
    @curator = Curator.find(params[:id])

    respond_to do |format|
      if @curator.update_attributes(params[:curator])
        format.html { redirect_to(@curator, :notice => 'Curator was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curator.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /curators/1
  # DELETE /curators/1.xml
  def destroy
    @curator = Curator.find(params[:id])
    @curator.destroy

    respond_to do |format|
      format.html { redirect_to(curators_url) }
      format.xml  { head :ok }
    end
  end
end
