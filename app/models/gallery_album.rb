class GalleryAlbum < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :feedback
  
  has_many :gallery_photos, :dependent => :destroy
  accepts_nested_attributes_for :gallery_photos, :allow_destroy => true
end
