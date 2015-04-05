class ArtIllustrationInner < ActiveRecord::Base

  belongs_to :art_illustration, :dependent => :destroy


  validates :show_index, presence: true, numericality: true


  has_attached_file :image
  validates_attachment :image, presence: true,
                       content_type: {content_type: ["image/png", "image/jpg", "image/jpeg", "image/svg+xml"]}

end
