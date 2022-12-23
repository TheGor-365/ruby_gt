class GuideCode < ApplicationRecord
  belongs_to :guide, inverse_of: :guide_codes, optional: true
  validates_presence_of :guide

  belongs_to :lang

  has_rich_text :description
end
