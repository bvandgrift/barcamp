class BarcampsController < ApplicationController
  # GET /barcamps
  # GET /barcamps.xml
  def index
    @barcamps = Barcamp.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @barcamps }
    end
  end

  # GET /barcamps/1
  # GET /barcamps/1.xml
  def show
    @barcamp = Barcamp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @barcamp }
    end
  end

  # GET /barcamps/new
  # GET /barcamps/new.xml
  def new
    @barcamp = Barcamp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @barcamp }
    end
  end

  # GET /barcamps/1/edit
  def edit
    @barcamp = Barcamp.find(params[:id])
  end

  # POST /barcamps
  # POST /barcamps.xml
  def create
    @barcamp = Barcamp.new(params[:barcamp])

    respond_to do |format|
      if @barcamp.save
        flash[:notice] = 'Barcamp was successfully created.'
        format.html { redirect_to(@barcamp) }
        format.xml  { render :xml => @barcamp, :status => :created, :location => @barcamp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @barcamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /barcamps/1
  # PUT /barcamps/1.xml
  def update
    @barcamp = Barcamp.find(params[:id])

    respond_to do |format|
      if @barcamp.update_attributes(params[:barcamp])
        flash[:notice] = 'Barcamp was successfully updated.'
        format.html { redirect_to(@barcamp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @barcamp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /barcamps/1
  # DELETE /barcamps/1.xml
  def destroy
    @barcamp = Barcamp.find(params[:id])
    @barcamp.destroy

    respond_to do |format|
      format.html { redirect_to(barcamps_url) }
      format.xml  { head :ok }
    end
  end
end
