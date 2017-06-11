class Curriculum < ApplicationRecord
  has_attached_file :foto, styles: { thumb: "100x150", medium: '200x250'}
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
