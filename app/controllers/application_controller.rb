class ApplicationController < ActionController::Base

  before_filter :set_locale
  helper :all


  protect_from_forgery

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :tab => params[:tab], :locale => I18n.locale }
  end

  def set_locale
    if (params[:locale].to_s == "no")
      params[:locale] = :nb
    end
    I18n.locale = params[:locale] || I18n.default_locale
    logger.debug I18n.locale
  end

end
