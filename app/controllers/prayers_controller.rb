class PrayersController < ApplicationController
  def new
    @prayer = @logged_in.prayers.new
  end

  def create
    if @prayer.save
      redirect_to group_prayer_requests_path(@group), notice: 'All good!'
    else
      render action: 'prayer_requests/show', alert: 'Not so good!'
    end
  end

  def show
  end
end
