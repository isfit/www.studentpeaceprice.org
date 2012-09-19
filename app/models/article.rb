class Article < ActiveRecord::Base
  self.primary_key = :id

  scope :visible, where(deleted: 0, visible: 1)
  scope :sorted, order("weight DESC")
  scope :norwegian, where("title_no IS NOT ''")
  scope :english, where("title_en IS NOT ''")

  has_attached_file :spp_article_image, styles: {
      front_large: {geometry: "620x365#", processors: [:cropper]},
      front_small: {geometry: "220x131#", processors: [:cropper_half]},
      article: {geometry: "447x346#", processors: [:cropper_spp_one_third]}
  },
                    url: "/system/spp_articles/:attachment/:id_partition/:style/:filename",
                    path: ":rails_root/public/system/spp_articles/:attachment/:id_partition/:style/:filename"
end
