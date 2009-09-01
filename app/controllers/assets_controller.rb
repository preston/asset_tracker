class AssetsController < ApplicationController

  before_filter :setup_check, :only => [:index]
  
  def setup_check
    # TODO Horrible bad way to do this for performance reasons... :()
     if (User.count == 0 || Manufacturer.count == 0 || Model.count == 0 || Location.count == 0 || Kind.count == 0)
       redirect_to :controller => :setup, :action => :needed
     end    
  end
  
  
  # GET /assets
  # GET /assets.xml
  def index
    @assets = Asset.find(:all, :include => [:user, {:model => [:manufacturer, :kind]}], :order => 'users.login ASC, manufacturers.name ASC')
    @asset = Asset.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.xml
  def show
    @asset = Asset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.xml
  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.xml
  def create
    @asset = Asset.new(params[:asset])

    respond_to do |format|
      if @asset.save
        flash[:notice] = 'Asset was successfully created.'
        Notifications.deliver_assigned(@asset)
        format.html { redirect_to(assets_path) }
        format.xml  { render :xml => @asset, :status => :created, :location => @asset }
        format.js
      else
        format.html { render :action => :index }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end


  # PUT /assets/1
  # PUT /assets/1.xml
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        flash[:notice] = 'Asset was successfully updated.'
        Notifications.deliver_assigned(@asset)
        format.html { redirect_to(assets_path) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.xml
  def destroy
    @id = params[:id]
    @asset = Asset.find(@id)
    @asset.destroy
    # Notifications.deliver_unassigned(@asset)

    respond_to do |format|
      format.html { redirect_to(assets_url) }
      format.xml  { head :ok }
      format.js
    end
  end
  
end
