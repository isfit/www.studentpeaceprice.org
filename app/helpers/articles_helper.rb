module ArticlesHelper
  def format(str)
    set_correct_tags(str)
    reg = Regexp.new(/\[([\w ,:"]+)\]\(([A-Za-z0-9_:.=&+-?\/]+)\)/)
    str.gsub!(reg, "<a href=\"\\2\" target=\"_blank\">\\1</a>")

    bc = BlueCloth.new(str) 
    #str.gsub!(/([^>])\s*\r\n\r\n\s*([^<])/m, "\\1<br /><br />\\2")
    #str.gsub!(/([^>])\s*\r\n\s*([^<])/m, "\\1<br />\\2")
    #str

    text = bc.to_html
    #set_correct_tags(text)
    text
  end

  def set_correct_tags(text)
    while text.index('##pic') != nil
      t_start = text.index('##pic')
      t_end = text.index('pic##')
      reg = Regexp.new(/##pic (\d+) (\d+) pic##/)
      match = reg.match(text[t_start..t_end+4])
      img_id = match[1]
      img_type = match[2]
      url = article_image(img_id.to_i, img_type.to_i, false)
      text[t_start..t_end+4] = url
    end

    while text.index('#l#pic') != nil
      t_start = text.index('#l#pic')
      t_end = text.index('pic#l#')
      reg = Regexp.new(/#l#pic (\d+) (\d+) pic#l#/)
      match = reg.match(text[t_start..t_end+5])
      img_id = match[1]
      img_type = match[2]
      url = article_image(img_id.to_i, img_type.to_i, true)
      text[t_start..t_end+5] = url
    end
  end

  def article_image(picture_id, type, link)
    picture = Photo.find_by_id(picture_id)
    style = case type.to_s
      when "1" then "photo_full"
      when "2" then "photo_one_third_left"
      when "3" then "photo_one_third_middle"
      when "4" then "photo_one_third_right"
    end

    img_text = picture.image_text_en
    pic_url = type == 1 ? picture.spp_full_article_picture.url : picture.spp_one_third_article_picture.url
    #Change on prod!

    if (link)
      url = "<a href=/images/#{picture.original_picture.url}><div class=#{style}><img src =/images/#{pic_url}  /><br /><i>#{picture.credits}</i><br /><i>#{picture.image_text_en}</i></div></a>"
    else
      url = "<div class=#{style}><img src =/images/#{pic_url}  /><br /><i>#{picture.credits}</i><br /><i>#{picture.image_text_en}</i></div>"
    end
  end
end
