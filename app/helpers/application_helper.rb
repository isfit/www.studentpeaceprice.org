#require 'bluecloth'
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def format(str)
   BlueCloth::new(str).to_html
  end


  def clever_image_tag(source,type, options = {})
  path = "#{Rails.root}" + "/public/assets/"+source+".jpg"
   if File.exists?(path)
    source += ".jpg"
    image_tag(source, options)
   else
    #image_tag("bilde#{type}.png",options)
   end
  end
end
