unless bluecloth
  require 'bluecloth'
end
class ImgTag < BlueCloth
  span_class = ""
  if atts =~ /class="([^\"]+)"/
    span_class = $1
  end

  (caption, img_url) = content.split("|").map { |w| w.strip! }
  figure_name = "Figure "+ @figure_counter.chr
  figure_id = figure_name.downcase.gsub(" ", "-")
  @figure_counter +=1

  str = "<img src=" + figure_id +"></img>"


end
