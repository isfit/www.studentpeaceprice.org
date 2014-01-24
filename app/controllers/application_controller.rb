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
    I18n.locale = params[:locale] || find_locale
    logger.debug I18n.locale
  end

  def find_locale
    country_code = get_country_code_by_id(request.remote_ip)
    if country_code = "no"
      :nb
    else
      I18n.default_locale
    end
  end

  def get_country_code_by_id(ip)
    begin
      output= IO.popen("whois #{ip} | grep country:")
      output.gets[8..-1].strip.downcase
    rescue
      "en"
    end
  end
end
