class ArtIllustration < ActiveRecord::Base


  has_many :art_illustration_inners
  accepts_nested_attributes_for :art_illustration_inners, :reject_if => :all_blank, :allow_destroy => true


  validates :name, presence: true, length: {minimum: 1}

  validates :show_index, presence: true, numericality: true

  validates :back_color, presence: true, length: {minimum: 1}


  has_attached_file :image, styles: {thumbnail: 'x100'}
  validates_attachment :image, presence: true,
                       content_type: {content_type: ["image/png", "image/jpg", "image/jpeg", "image/svg+xml"]}


end
