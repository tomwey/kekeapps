# coding: utf-8
class Cpanel::NotificationsController < Cpanel::ApplicationController
  def index
    @notifications = Notification.paginate :page => params[:page], :per_page => 30
  end
  
  def new
    @notification = Notification.new
  end
  
  def create
    @notification = Notification.new(params[:notification])
    if @notification.save
      redirect_to cpanel_notifications_url, notice: 'Notificaiton was successfully created.'
    else
      render 'new'
    end
  end
  
end
