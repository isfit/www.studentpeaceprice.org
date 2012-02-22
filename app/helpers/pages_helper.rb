module PagesHelper
  def format_ingress(text)
    text.gsub!(/_([\w ]+)_/) {|match| "<em>#{$1}</em>"}
    text.html_safe
  end
end
