module ApplicationHelper

  def profile_img(user)
    unless user.provider.blank?
      img_url = user.image_url
    else
      img_url = "wh50.jpg"
    end
      image_tag(img_url, alt: user.name)
  end
end

=begin
require 'mini_magick'
img = MiniMagick::Image.open('/Users/shin/workspace/buzzwalls/app/assets/images/no_image.jpg')
img.write "resize.jpg"
img.resize "50x50"
img.write "wh50.jpg"
img_url = "wh50.jpg"
=end
