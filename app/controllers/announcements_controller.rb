class AnnouncementsController < ApplicationController
	
	before_filter :require_user
	
  # GET /announcements
  # GET /announcements.json
  def index
    @announcements = Announcement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/list  
  def list
    
    if session[:announcement_min_date].blank? then
      session[:announcement_min_date]=@current_time.localtime-1.week
    end
    
    if params.has_key? :announcement_min_date then
    	if !params[:announcement_min_date].blank? 
      	session[:announcement_min_date] = params[:announcement_min_date]
      else
      	session[:announcement_min_date]=@current_time.localtime-1.week
      end
    end
    
    @min_date = session[:announcement_min_date].to_datetime.utc
      
    @announcements = Announcement.find :all, order: 'updated_at desc', 
    conditions: ["updated_at between \'#{@min_date}\' and \'#{@current_time.to_datetime.utc}\'"]
    
    respond_to do |format|
      format.html # list.html.erb
    end
  end  
  
  # GET /announcements/1
  # GET /announcements/1.json
  def show
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    @announcement = Announcement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    @announcement = Announcement.new(params[:announcement])

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :ok }
    end
  end
end
