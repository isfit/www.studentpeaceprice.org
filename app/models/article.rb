class Article < ActiveRecord::Base
  set_primary_key :id
  
  has_attached_file :spp_article_image, styles:  {
    front_large: {geometry: "346x154#", processors: [:cropper] },
    front_small: {geometry: "220x131#", processors: [:cropper_half] },
    article: {geometry: "447x346#", processors: [:cropper_spp_one_third] }
    }
end
