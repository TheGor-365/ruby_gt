class GuideCode < ApplicationRecord
  belongs_to :guide, inverse_of: :guide_codes, optional: true
  belongs_to :lang
  validates_presence_of :guide

  has_many :steps, as: :stepable

  has_rich_text :description
end
