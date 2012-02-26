class Article < ActiveRecord::Base
  self.primary_key = :id

  scope :visible, where(deleted: 0, visible: 1)
  scope :sorted, order("weight DESC")
  
  has_attached_file :spp_article_image, styles:  {
    front_large: {geometry: "620x365#", processors: [:cropper] },
    front_small: {geometry: "220x131#", processors: [:cropper_half] },
    article: {geometry: "447x346#", processors: [:cropper_spp_one_third] }
    }
end
