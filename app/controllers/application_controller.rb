# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time

  @side_quote = Quote.find(:all, :conditions=>"side = 1", :order=>:weight).last
  @top_quote = Quote.find(:all, :conditions=>"top = 1", :order=>:weight).last
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '279e060fc95634856c631f6e3d81d540'

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :tab => params[:tab] }
  end
end
