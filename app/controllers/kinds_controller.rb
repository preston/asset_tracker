class KindsController < ApplicationController
  # GET /kinds
  # GET /kinds.xml
  def index
    @kinds = Kind.find(:all, :include => [:models => :assets])
    @kind = Kind.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kinds }
    end
  end

  # GET /kinds/1
  # GET /kinds/1.xml
  def show
    @kind = Kind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kind }
    end
  end

  # GET /kinds/new
  # GET /kinds/new.xml
  def new
    @kind = Kind.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kind }
    end
  end

  # GET /kinds/1/edit
  def edit
    @kind = Kind.find(params[:id])
  end

  # POST /kinds
  # POST /kinds.xml
  def create
    @kind = Kind.new(params[:kind])

    respond_to do |format|
      if @kind.save
        flash[:notice] = 'Kind was successfully created.'
        format.html { redirect_to(kinds_path) }
        format.xml  { render :xml => @kind, :status => :created, :location => @kind }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kind.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /kinds/1
  # PUT /kinds/1.xml
  def update
    @kind = Kind.find(params[:id])

    respond_to do |format|
      if @kind.update_attributes(params[:kind])
        flash[:notice] = 'Kind was successfully updated.'
        format.html { redirect_to(kinds_path) }
        format.xml  { head :ok }
        format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kind.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /kinds/1
  # DELETE /kinds/1.xml
  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy

    respond_to do |format|
      format.html { redirect_to(kinds_url) }
      format.xml  { head :ok }
      format.js
    end
  end
end
