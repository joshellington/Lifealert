class SitesController < ApplicationController
  def index
    @site = Site.new
    @sites = Site.all
  end

  def create
    Site.create params[:site]
    redirect_to :back
  end

  def edit
    @site = Site.find params[:id]
  end

  def update
    site = Site.find params[:id]
    if site.update_attributes params[:url]
      redirect_to sites_path, :notice => 'Your site has successfully been updated.'
    else
      redirect_to :back, :notice => 'There was an error updating your site.'
    end
  end

  def destroy
    Site.destroy params[:id]
    redirect_to :back, :notice => 'Task has been deleted.'
  end
end