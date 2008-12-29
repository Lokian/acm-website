class RsvpsController < ApplicationController
  before_filter :require_user
  
  # GET /rsvps
  # GET /rsvps.xml
  def index
    @rsvps = Rsvp.find_all_by_user_id(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rsvps }
    end
  end
  
  def create
    @rsvp = Rsvp.new(params[:rsvp])

    respond_to do |format|
      if @rsvp.save
        format.js
        format.html { redirect_to(@rsvp.event) }
      else
        flash[:error] = 'Unable to save RSVP. Please try again or contact the ACM Web Developer.'
        format.html { redirect_to(@rsvp.event) }
      end
    end
  end
  
  # DELETE /rsvps/1
  # DELETE /rsvps/1.xml
  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy

    respond_to do |format|
      format.html { redirect_to(rsvps_url) }
      format.xml  { head :ok }
    end
  end
  
end
