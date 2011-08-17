class GalleryPhoto < ActiveRecord::Base
  belongs_to :gallery_album
  belongs_to :feedback
  has_attached_file :photo,
      :path =>":rails_root/public/images/galleries/:gallery/:gallery_album/:id/:style.:extension", 
      :url => "/images/galleries/:gallery/:gallery_album/:id/:style.:extension", 
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :original => "1280x1024>" }
        
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 2.megabytes  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
