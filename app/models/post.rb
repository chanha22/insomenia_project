class Post < ApplicationRecord
  resourcify
  include Authority::Abilities
  
  belongs_to :cafe
  belongs_to :user
  has_many :comments

  mount_uploader :image, PostUploader
end
