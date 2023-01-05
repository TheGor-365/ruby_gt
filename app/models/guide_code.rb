class GuideCode < ApplicationRecord
  belongs_to :guide, counter_cache: true
  belongs_to :lang

  has_rich_text :description
end
