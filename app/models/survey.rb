class Survey < ActiveRecord::Base
  has_many :questions
  belongs_to :user
  mount_uploader :image_path, Avatar
end
