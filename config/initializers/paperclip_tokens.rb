Paperclip.interpolates :gallery do |attachment,style| 
    attachment.instance.gallery_album.gallery_id
end

Paperclip.interpolates :gallery_album do |attachment,style| 
    attachment.instance.gallery_album_id
end