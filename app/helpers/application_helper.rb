#require 'bluecloth'
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


#  def format(str)
#   BlueCloth::new(str).to_html
#  end


  def clever_image_tag(source,type, options = {})
  path = "#{Rails.root}" + "/public/assets/"+source+".jpg"
   if File.exists?(path)
    source += ".jpg"
    image_tag(source, options)
   else
    #image_tag("bilde#{type}.png",options)
   end
  end

  def use_english?
    I18n.locale.to_s == "en"
  end

  def tab_dropdown_link_to(tab)
    "<a href='#' class='dropdown-toggle' data-toggle='dropdown'>#{use_english? ? tab.name_en.html_safe : tab.name_no.html_safe}<b class='caret'></b></a>".html_safe
  end

  def tab_link_to(tab, sublink)
    raw link_to(use_english? ? tab.name_en.html_safe : tab.name_no.html_safe, page_path(sublink.page, :tab => tab.tag))
  end

  def sublink_to(tab, sublink)
    if sublink.no_urls?
      raw link_to use_english? ? sublink.title_en : sublink.title_no, page_path(sublink.page, :tab => tab.tag)
    elsif sublink.url.blank?
      raw link_to use_english? ? sublink.title_en : sublink.title_no, sublink.external_url, target: "_BLANK"
    elsif sublink.external_url.blank?
      raw link_to use_english? ? sublink.title_en : sublink.title_no, sublink.url
    end
  end

  def append_active_class_if_active(tab)
      params[:tab] == tab.tag ? "active" : ""
  end
end
