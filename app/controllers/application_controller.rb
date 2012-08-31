class ApplicationController < ActionController::Base

  before_filter :set_locale
  helper :all

  @side_quote = Quote.where(:side=>true).order('quotes.weight DESC').last
  @top_quote = Quote.where(:top=>true).order('quotes.weight DESC').last

  protect_from_forgery

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :tab => params[:tab], :locale => I18n.locale }
  end

  def set_locale
    logger.debug "set_locale"
    logger.debug params[:locale]
    logger.debug I18n.locale
    I18n.locale = params[:locale] || I18n.default_locale
    logger.debug I18n.locale
  end

end
