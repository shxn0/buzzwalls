class Wall < ActiveRecord::Base
  validates:picture, presence:true
  belongs_to :user
  mount_uploader :picture, PictureUploader
end
